import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/futuers/user/data/repository/loginDataRepository/loginDataRepo.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/loginUserEntity.dart';
import 'package:delivery_app/futuers/user/presention/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'deleivery_state.dart';

class DeleiveryCubit extends Cubit<DeleiveryState> {
  late LoginDataRepo loginDataRepo;

  DeleiveryCubit() : super(DeleiveryInitial());

  Future<void> login({
    required String userId,
    required String password,
    required String languageNo,
  }) async {
    emit(LoginLoading());
    final resuilt = await loginDataRepo
        .postLoginData(
          userId: userId,
          password: password,
          languageNo: languageNo,
        )
        .then((sucess) {
          emit(LoginSuccess());
        })
        .catchError((error) {
          emit(LoginFailure());
        });
  }
}
