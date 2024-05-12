import 'package:flutter/material.dart';
import 'package:space_x/core/helpers/cache_helpers.dart';
import 'package:space_x/core/helpers/cache_keys.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(child: Column(
          children: [
            const Text('Home Screen'),
            TextButton(onPressed: ()async{
                await CacheHelper.removeData(key: CacheKeys.loginKey);
                context.pushReplacementNamed(Routes.loginScreen);
            }, child: Icon(Icons.login_outlined))
          ],
        )),
      ),
    );
  }
}