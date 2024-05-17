import 'package:get_it/get_it.dart';
import 'package:space_x/core/networking/api_service.dart';
import 'package:space_x/features/crews/data/repos/crew_repo_implementaion.dart';
import 'package:space_x/features/launchpads/data/repos/launchpads_repo_implementaion.dart';
import 'package:space_x/features/rockets/logic/repos/rocket_repo_implementation.dart';

final getIt = GetIt.instance;
void diSetup() {
  getIt.registerSingleton<RocketRepoImpl>(
    RocketRepoImpl(
      apiService: ApiService(),
    ),
  );

  getIt.registerSingleton<CrewRepoImpl>(CrewRepoImpl(apiService: ApiService()));


  getIt.registerSingleton<LaunchpadsRepoImpl>(
    LaunchpadsRepoImpl(apiService: ApiService())
  );
}
