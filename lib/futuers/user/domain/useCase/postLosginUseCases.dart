import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/futuers/user/domain/repository/loginRepo.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/loginUserEntity.dart';

class Losginusecases {
  final Loginrepo loginrepo;
  Losginusecases({required this.loginrepo});
  Future<Either<Failure, LoginUserEntity>> call() {
    return loginrepo.postLoginData(userId: '', password: '', languageNo: '');
  }
}
