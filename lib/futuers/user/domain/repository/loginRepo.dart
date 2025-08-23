import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/loginUseEntity.dart';

abstract class Loginrepo {
  Future<Either<Failure, Loginuseentity>> postLoginData();
}
