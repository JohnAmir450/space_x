import 'package:dartz/dartz.dart';
import 'package:space_x/core/networking/failures.dart';
import 'package:space_x/features/crews/data/models/crew_model.dart';

abstract class CrewRepo{
  Future<Either<Failure,List<CrewModel>>>getCrew();
}