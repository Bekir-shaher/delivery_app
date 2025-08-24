
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/futuers/user/domain/repository/loginRepo.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/loginUserEntity.dart';

class LoginUseCase {
  final LoginRepo repo;
  LoginUseCase(this.repo);

  Future<Either<Failure, LoginUserEntity>> call({
    required String userId,
    required String password,
    required int languageNo,
  }) {
    return repo.postLoginData(
      userId: userId,
      password: password,
      languageNo: languageNo,
    );
  }
}
