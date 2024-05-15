import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/cache_helpers.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/features/home/logic/home_cubit/home_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeScreenCubitStateSuccess) {
          print(state.data['profileImage'].toString());
          return Drawer(
            child: SafeArea(
              child: Column(
                children: [
                  verticalSpace(50.h),
                  CircleAvatar(
                    radius: 88,
                    backgroundColor: ColorsManager.purple,
                    child: state.data['profileImage'] !=
                            'assets/images/default_profile_image.jpg'
                        ? CircleAvatar(
                            radius: 90.h,
                            backgroundImage:
                                FileImage(File(state.data['profileImage'])))
                        : CircleAvatar(
                            radius: 90.h,
                            backgroundImage: const AssetImage(
                                'assets/images/default_profile_image.jpg'),
                          ),
                  ),
                  verticalSpace(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Hi, ',
                        style: TextStyles.font24BlackBold,
                      ),
                      Text(
                        '${state.data['userName']}',
                        style: TextStyles.font26WhiteBold
                            .copyWith(color: ColorsManager.purple),
                      )
                    ],
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      CacheHelper.clearAllData();
                      context.pushNamed(Routes.loginScreen);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Log Out',
                          style: TextStyles.font14GreyRegular
                              .copyWith(color: Colors.red, fontSize: 18),
                        ),
                        horizontalSpace(8.w),
                        const Icon(
                          Icons.logout_outlined,
                          color: Colors.red,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(100.h),
                ],
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
