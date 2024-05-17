import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:space_x/core/networking/api_service.dart';
import 'package:space_x/core/networking/failures.dart';
import 'package:space_x/features/rockets/logic/models/rocket_model/rocket_model.dart';
import 'package:space_x/features/rockets/logic/repos/rocket_repo.dart';

class RocketRepoImpl extends RocketRepo {
  final ApiService apiService;

  RocketRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<RocketModel>>> fetchRockets() async {
    try {
      var data = await apiService.get(endPoints: 'rockets');
      List<RocketModel> rockets = [];
      for (var item in data) {
        try {
          rockets.add(RocketModel.fromJson(item));
        } catch (e) {
          print(item);
        }
      }

      return right(rockets);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
