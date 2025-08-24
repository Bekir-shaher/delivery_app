part of 'deleivery_cubit.dart';

@immutable
sealed class DeliveryStatusState {}

final class DeliveryStatusInitial extends DeliveryStatusState {}

final class LoginLoading extends DeliveryStatusState {}

final class LoginFailure extends DeliveryStatusState {
  final String message;
  LoginFailure(this.message);
}

final class LoginSuccess extends DeliveryStatusState {
  final String deliveryName;
  LoginSuccess(this.deliveryName);
}


// @immutable
// sealed class DeleiveryState {}

// final class DeleiveryInitial extends DeleiveryState {}

// final class LoginSuccess extends DeleiveryState {}

// final class LoginFailure extends DeleiveryState {}

// final class LoginLoading extends DeleiveryState {}
