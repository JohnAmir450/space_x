part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginCubitInitial extends LoginState {}

final class LoginCubitLoading extends LoginState {}


final class LoginCubitSuccess extends LoginState {}


final class LoginCubitFailure extends LoginState {
  final String errorMessage;

  LoginCubitFailure({required this.errorMessage});
}
