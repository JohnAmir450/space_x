import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:space_x/core/networking/api_service.dart';
import 'package:space_x/core/networking/failures.dart';
import 'package:space_x/features/crews/data/models/crew_model.dart';
import 'package:space_x/features/crews/data/repos/crew_repo.dart';

class CrewRepoImpl extends CrewRepo {
  final ApiService _apiService;

  CrewRepoImpl({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failure, List<CrewModel>>> getCrew() async {
    try {
      var data = await _apiService.get(endPoints: 'crew');
      List<CrewModel> crew = [];
      for (var item in data) {
        crew.add(CrewModel.fromJson(item));
        
      }
      return right(crew);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
