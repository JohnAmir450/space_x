import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/di/di_setup.dart';
import 'package:space_x/core/helpers/bloc_observer.dart';
import 'package:space_x/core/helpers/cache_helpers.dart';
import 'package:space_x/core/helpers/cache_keys.dart';
import 'package:space_x/core/networking/api_service.dart';
import 'package:space_x/core/routing/app_router.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/firebase_options.dart';

void main() async {
  diSetup();
  await ApiService.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: _getInitialRoute()),
    );
  }

  String _getInitialRoute() {
    bool? isLoggedIn = CacheHelper.getData(key: CacheKeys.loginKey) as bool?;
    bool? isRegistered =
        CacheHelper.getData(key: CacheKeys.registerKey) as bool?;

    if (isLoggedIn == true || isRegistered == true) {
      return Routes.homeScreen;
    } else {
      return Routes.loginScreen;
    }
  }
}
