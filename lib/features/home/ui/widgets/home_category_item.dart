import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/font_helper.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/features/home/data/models/home_categories_model.dart';

class HomeCategoryItem extends StatelessWidget {
  final HomeModel homeModel;
  const HomeCategoryItem({
    super.key,
    required this.homeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 290.h,
            width: 300.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  homeModel.title,
                  style: TextStyles.font22BlackBold.copyWith(
                    color: ColorsManager.purple,
                  ),
                ),
                Text(
                  homeModel.description,
                  textAlign: TextAlign.center,
                  style: TextStyles.font22BlackBold
                      .copyWith(fontWeight: FontWeightHelper.regular),
                ),
                verticalSpace(16.h),
                const CircleAvatar(
                  backgroundColor: ColorsManager.purple,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -60),
          child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                homeModel.image,
                height: 250.h,
              )),
        )
      ],
    );
  }
}
