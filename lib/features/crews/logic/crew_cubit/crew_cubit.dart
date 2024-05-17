import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/helpers/snak_bar_view.dart';
import 'package:space_x/features/crews/data/models/crew_model.dart';
import 'package:space_x/features/crews/data/repos/crew_repo.dart';
import 'package:url_launcher/url_launcher.dart';
part 'crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  final CrewRepo crewRepo;
  CrewCubit(this.crewRepo) : super(CrewInitial());

  Future<void> fetchCrew() async {
    emit(CrewLoadingState());
    var result = await crewRepo.getCrew();
    result.fold(
        (failure) => emit(CrewFailureState(errorMessage: failure.errorMessage)),
        (crews) => emit(CrewSuccessState(crews: crews)));
  }

  Future<void> fetchLink(BuildContext context, {required String link}) async {
    String url = link;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      showSnackBar(context, text: 'Link is unavailable', color: Colors.amber);
    }
  }
}
