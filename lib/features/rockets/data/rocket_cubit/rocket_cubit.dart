import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_x/features/rockets/logic/models/rocket_model/rocket_model.dart';
import 'package:space_x/features/rockets/logic/repos/rocket_repo.dart';

part 'rocket_state.dart';

class RocketCubit extends Cubit<RocketState> {
  final RocketRepo rocketRepo;
  RocketCubit(this.rocketRepo) : super(RocketInitial());

  Future<void> fetchRockets() async {
    emit(RocketLoadingState());
    var results = await rocketRepo.fetchRockets();
    results.fold(
        (failure) =>
            emit(RocketFailureState(errorMessage: failure.errorMessage)),
        (rockets) => emit(RocketSuccessState(rockets: rockets)));
  }
}
