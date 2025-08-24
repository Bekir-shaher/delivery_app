import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/core/network/networkInfo.dart';
import 'package:delivery_app/futuers/user/data/dataSource/LoginRemoteDataSource.dart';
import 'package:delivery_app/futuers/user/data/model/LoginResponseModel.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/ResultEntity.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/loginUserEntity.dart';
import 'package:delivery_app/futuers/user/domain/repository/loginRepo.dart';
import 'package:delivery_app/futuers/user/data/dataSource/localDataBase/users.dart';

class LoginDataRepo implements LoginRepo {
  final LoginRemoteDataSource remote;
  final NetworkInfo network;
  final AppDatabase db;

  LoginDataRepo({
    required this.remote,
    required this.network,
    required this.db,
  });
  @override
  Future<Either<Failure, LoginUserEntity>> postLoginData({
    required String userId,
    required String password,
    required int languageNo,
  }) async {
    if (!await network.isConnected) {
      return left(Failure(errorMassge: 'There is no internet connection'));
    }

    try {
      final response = await remote.postLogin(
        userId: userId,
        password: password,
        languageNo: languageNo,
      );

      if (response.statusCode != 200) {
        return left(Failure(errorMassge: 'Login failed'));
      }

      final map = jsonDecode(response.body) as Map<String, dynamic>;
      final model = LoginResponseModel.fromJson(map);

      final deliveryName = model.data?.deliveryName ?? '';
      final result = model.result;

      // خزّن الاسم محليًا (اختياري)
      if (deliveryName.isNotEmpty) {
        await db.insertUser(deliveryName);
      }

      final entity = LoginUserEntity(
        deliveryName: deliveryName,
        result: ResultEntity(
          errNo: result?.errNo ?? -1,
          errMsg: result?.errMsg ?? '',
        ),
      );

      return right(entity);
    } catch (e) {
      return left(Failure(errorMassge: 'Unexpected error: $e'));
    }
  }
}
