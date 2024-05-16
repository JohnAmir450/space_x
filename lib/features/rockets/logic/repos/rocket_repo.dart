import 'package:dartz/dartz.dart';
import 'package:space_x/core/networking/failures.dart';
import 'package:space_x/features/rockets/logic/models/rocket_model/rocket_model.dart';

abstract class RocketRepo {
  Future<Either<Failure, List<RocketModel>>> fetchRockets();
}
