import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/core/network/networkInfo.dart';
import 'package:delivery_app/futuers/user/data/dataSource/loginatatSource/loginRemoteDataSource.dart';
import 'package:delivery_app/futuers/user/data/model/loginModel.dart';
import 'package:delivery_app/futuers/user/domain/repository/loginRepo.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/loginUserEntity.dart';

class LoginDataRepo implements Loginrepo {
  final Loginremotedatasource loginremotedatasource;
  final Networkinfo networkinfo;
  final Loginmodel loginmodel;
  LoginDataRepo(this.loginremotedatasource, this.networkinfo, this.loginmodel);

  @override
  Future<Either<Failure, LoginUserEntity>> postLoginData({
    required String userId,
    required String password,
    required String languageNo,
  }) async {
    if (!await networkinfo.isConnected) {
      return left(Failure(errorMassge: "There is no internet connection"));
    }
    try {
      final response = await loginremotedatasource.postLogin(
        userId: userId,
        password: password,
        languageNo: languageNo,
      );

      if (response.statusCode == 200) {
        return Right(
          LoginUserEntity(
            DeliveryName: loginmodel.DeliveryName,
            resulitEntity: loginmodel.resulitEntity,
          ),
        );
      } else {
        return left(Failure(errorMassge: "Login failed"));
      }
    } catch (e) {
      return left(Failure(errorMassge: "There is no internet connection"));
    }
  }
}
