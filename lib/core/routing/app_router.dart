import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/di/di_setup.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/features/crews/ui/crew_screen.dart';
import 'package:space_x/features/home/logic/home_cubit/home_cubit.dart';
import 'package:space_x/features/home/ui/home_screen.dart';
import 'package:space_x/features/launchpads/ui/launchpads_screen.dart';
import 'package:space_x/features/login/logic/login_cubit/login_cubit.dart';
import 'package:space_x/features/login/ui/login_screen.dart';
import 'package:space_x/features/rockets/data/rocket_cubit/rocket_cubit.dart';
import 'package:space_x/features/rockets/logic/models/rocket_model/rocket_model.dart';
import 'package:space_x/features/rockets/logic/repos/rocket_repo_implementation.dart';
import 'package:space_x/features/rockets/ui/rocket_details_screen.dart';
import 'package:space_x/features/rockets/ui/rockets_screen.dart';
import 'package:space_x/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:space_x/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignUpCubit(),
                  child: const SignUpScreen(),
                ));

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit()..getUserData(),
                  child: const HomeScreen(),
                ));

      case Routes.crewScreen:
        return MaterialPageRoute(builder: (_) => const CrewScreen());

      case Routes.rocketsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      RocketCubit(getIt.get<RocketRepoImpl>())..fetchRockets(),
                  child: const RocketsScreen(),
                ));

      case Routes.rocketDetailsScreen:
      var model=settings.arguments as RocketModel;
        return MaterialPageRoute(builder: (_) =>  RocketDetailsScreen(rocketModel: model,));

      case Routes.launchpadsScreen:
        return MaterialPageRoute(builder: (_) => const LaunchpadsScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('no route defined for ${settings.name}')),
                ));
    }
  }
}
