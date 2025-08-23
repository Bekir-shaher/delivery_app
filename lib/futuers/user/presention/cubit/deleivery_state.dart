part of 'deleivery_cubit.dart';

@immutable
sealed class DeleiveryState {}

final class DeleiveryInitial extends DeleiveryState {}

final class LoginSuccess extends DeleiveryState {}

final class LoginFailure extends DeleiveryState {}

final class LoginLoading extends DeleiveryState {}
