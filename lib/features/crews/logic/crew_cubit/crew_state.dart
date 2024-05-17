part of 'crew_cubit.dart';

sealed class CrewState extends Equatable {
  const CrewState();

  @override
  List<Object> get props => [];
}

final class CrewInitial extends CrewState {}

final class CrewLoadingState extends CrewState {}

final class CrewSuccessState extends CrewState {
  final List<CrewModel> crews;

  const CrewSuccessState({required this.crews});
}

final class CrewFailureState extends CrewState {
  final String errorMessage;

  const CrewFailureState({required this.errorMessage});
}
