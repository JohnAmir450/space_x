import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/features/home/ui/widgets/blurred_back_gorund.dart';
import 'package:space_x/features/launchpads/ui/widgets/launchpads_List_view_item.dart';

class LaunchpadsScreen extends StatelessWidget {
  const LaunchpadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredBackGroundImage(
          bodyWidgets: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.only(top: 15.h,right: 12.h),
                child: GestureDetector(
                  onTap: (){
                    context.pushNamed(Routes.launchpadsDetailsScreen);
                  },
                  child: const LaunchpadsListViewItem()),
              ))),
    );
  }
}
