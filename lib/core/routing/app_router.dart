import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/features/home/ui/home_screen.dart';
import 'package:space_x/features/login/logic/login_cubit/login_cubit.dart';
import 'package:space_x/features/login/ui/login_screen.dart';
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
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('no route defined for ${settings.name}')),
                ));
    }
  }
}
