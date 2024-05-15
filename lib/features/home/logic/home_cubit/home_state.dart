part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class HomeScreenCubitStateSuccess extends HomeState {
  final dynamic data; // Can be a map, list, or your custom user data model

  HomeScreenCubitStateSuccess(this.data);
}

class HomeScreenCubitStateError extends HomeState {
  final String message;

  HomeScreenCubitStateError(this.message);
}