import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/features/home/data/models/home_categories_model.dart';
import 'package:space_x/features/home/ui/widgets/blurred_back_gorund.dart';
import 'package:space_x/features/home/ui/widgets/custom_drawer.dart';
import 'package:space_x/features/home/ui/widgets/home_category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomDrawer(),
      body: BlurredBackGroundImage(
        bodyWidgets: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                verticalSpace(30),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.purple.withOpacity(0.4),
                    child: IconButton(
                        onPressed: () {
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                        icon: const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        )),
                  ),
                ),
                verticalSpace(100.h),
                const Text(
                  'Discover Space_X',
                  style: TextStyles.font26WhiteBold,
                ),
                verticalSpace(70.h),
                SizedBox(
                  height: 500,
                  child: CarouselSlider.builder(
                      itemCount: listHomeData.length,
                      itemBuilder: (context, index, realIndex) =>
                          GestureDetector(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    context.pushNamed(Routes.crewScreen);
                                  case 1:
                                    context.pushNamed(Routes.rocketsScreen);
                                  case 2:
                                    context.pushNamed(Routes.launchpadsScreen);
                                  default:
                                    const Scaffold(
                                      body: Center(
                                        child: Text('not defined route'),
                                      ),
                                    );
                                }
                              },
                              child: HomeCategoryItem(
                                homeModel: listHomeData[index],
                              )),
                      options: CarouselOptions(
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlay: true,
                          aspectRatio: 2,
                          height: 400,
                          enlargeCenterPage: true)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
