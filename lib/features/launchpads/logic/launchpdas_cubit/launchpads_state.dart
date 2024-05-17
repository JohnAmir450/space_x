part of 'launchpads_cubit.dart';

sealed class LaunchpadsState extends Equatable {
  const LaunchpadsState();

  @override
  List<Object> get props => [];
}

final class LaunchpadsInitialState extends LaunchpadsState {}

final class LaunchpadsLoadingState extends LaunchpadsState {}

final class LaunchpadsSuccessState extends LaunchpadsState {
  final List<LaunchpadsModel> launchpads;

  const LaunchpadsSuccessState({required this.launchpads});
}

final class LaunchpadsFailureState extends LaunchpadsState {
  final String errorMessage;

  const LaunchpadsFailureState({required this.errorMessage});
}
