import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:space_x/core/networking/api_service.dart';
import 'package:space_x/core/networking/failures.dart';
import 'package:space_x/features/launchpads/data/models/launchpads_model/launchpads_model.dart';
import 'package:space_x/features/launchpads/data/repos/lanchpads_repo.dart';

class LaunchpadsRepoImpl extends LaunchpadsRepo {
  final ApiService apiService;

  LaunchpadsRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<LaunchpadsModel>>> fetchLaunchpads() async {
    try {
      var data = await apiService.get(endPoints: 'launchpads');
      List<LaunchpadsModel> launchpads = [];

      for (var item in data) {
        launchpads.add(LaunchpadsModel.fromJson(item));
      }
      return right(launchpads);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
