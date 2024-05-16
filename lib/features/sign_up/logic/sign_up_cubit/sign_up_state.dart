part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitialState extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpFailureState extends SignUpState {
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});
}

final class ChangePasswordVisibilityState extends SignUpState {}

final class PickedPhotoState extends SignUpState {
  final String profileImagePath;

  PickedPhotoState({required this.profileImagePath});
}
