import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_x/features/launchpads/data/models/launchpads_model/launchpads_model.dart';
import 'package:space_x/features/launchpads/data/repos/lanchpads_repo.dart';

part 'launchpads_state.dart';

class LaunchpadsCubit extends Cubit<LaunchpadsState> {
  final LaunchpadsRepo launchpadsRepo;
  LaunchpadsCubit(this.launchpadsRepo) : super(LaunchpadsInitialState());

  Future<void> fetchLaunchpads() async {
    emit(LaunchpadsLoadingState());
    var data = await launchpadsRepo.fetchLaunchpads();
    data.fold(
      (failure) => emit(
        LaunchpadsFailureState(
          errorMessage: failure.errorMessage,
        ),
      ),
      (launchpads) => emit(
        LaunchpadsSuccessState(
          launchpads: launchpads,
        ),
      ),
    );
  }
}
