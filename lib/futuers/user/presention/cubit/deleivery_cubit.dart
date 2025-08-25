import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/failure/failure.dart';
import 'package:delivery_app/futuers/user/domain/useCase/LoginUseCase.dart';
import 'package:delivery_app/futuers/user/domain/userEntity/loginUserEntity.dart';
import 'package:delivery_app/futuers/user/presention/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'deleivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryStatusState> {
  final LoginUseCase loginUseCase;
  DeliveryCubit(this.loginUseCase) : super(DeliveryStatusInitial());

  Future<void> login({
    required String userId,
    required String password,
    required int languageNo,
  }) async {
    emit(LoginLoading());
    final either = await loginUseCase(
      userId: userId,
      password: password,
      languageNo: languageNo,
    );

    either.fold(
      (failure) => emit(LoginFailure(failure.errorMassge)),
      (user) => emit(LoginSuccess(user.deliveryName)),
    );
  }
}

