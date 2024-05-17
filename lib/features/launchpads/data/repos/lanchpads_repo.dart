import 'package:dartz/dartz.dart';
import 'package:space_x/core/networking/failures.dart';
import 'package:space_x/features/launchpads/data/models/launchpads_model/launchpads_model.dart';

abstract class LaunchpadsRepo{
  Future<Either<Failure,List<LaunchpadsModel>>>fetchLaunchpads();
}