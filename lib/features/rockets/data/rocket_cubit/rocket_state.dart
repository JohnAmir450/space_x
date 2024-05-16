part of 'rocket_cubit.dart';

sealed class RocketState extends Equatable {
  const RocketState();

  @override
  List<Object> get props => [];
}

final class RocketInitial extends RocketState {}

final class RocketLoadingState extends RocketState {}

final class RocketSuccessState extends RocketState {
  final List<RocketModel> rockets;

  const RocketSuccessState({required this.rockets});
}

final class RocketFailureState extends RocketState {
  final String errorMessage;

  const RocketFailureState({required this.errorMessage});
}
