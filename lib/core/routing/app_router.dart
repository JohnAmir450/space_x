import 'package:flutter/material.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/features/login/ui/login_screen.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.loginScreen:
      return MaterialPageRoute(builder: (_)=> const LoginScreen());


    default:
    return MaterialPageRoute(builder: (_)=> Scaffold(body: Center(child: Text('no route defined for ${settings.name}')),));    
    }
  }
}