import 'package:get_it/get_it.dart';
import 'package:space_x/core/networking/api_service.dart';
import 'package:space_x/features/rockets/logic/repos/rocket_repo_implementation.dart';

final getIt = GetIt.instance;
void diSetup() {
  getIt.registerSingleton<RocketRepoImpl>(
    RocketRepoImpl(
      apiService: ApiService(),
    ),
  );
}
