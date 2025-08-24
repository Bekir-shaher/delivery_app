// repository contract
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/loginUserEntity.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginUserEntity>> postLoginData({
    required String userId,
    required String password,
    required int languageNo,
  });
}


