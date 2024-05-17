

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/styles.dart';

class LaunchpadsListViewItem extends StatelessWidget {
  
  const LaunchpadsListViewItem({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 60.h),
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'crewModel.name!',
                style: TextStyles.font16WhiteSemiBold
                    .copyWith(color: ColorsManager.purple, fontSize: 18),
              ),
              verticalSpace(40),
              ListTile(
                title: const Text(
                  'Number of launches : ',
                  maxLines: 1,
                  style: TextStyles.font15DarkBlueMedium,
                ),
                trailing: Text('crewModel',
                    style: TextStyles.font15DarkBlueMedium),
              ),
              verticalSpace(6.h),
              ListTile(
                  title: const Text(
                    'status :',
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  trailing: Text('crewModel.status!',
                      // style: crewModel.status == 'active'
                      //     ? TextStyles.font15DarkBlueMedium
                      //         .copyWith(color: Colors.green)
                      //     : TextStyles.font15DarkBlueMedium
                      //         .copyWith(color: Colors.red))
              )),
              Transform.translate(
                offset: const Offset(0, 60),
                child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                        ))),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'crewModel.agency!',
                    style: TextStyles.font16WhiteSemiBold
                        .copyWith(color: ColorsManager.purple, fontSize: 18),
                  ))
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            radius: 65,
            backgroundColor: ColorsManager.purple,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              backgroundImage: NetworkImage('crewModel.image!'),
            ),
          ),
        )
      ],
    );
  }
}
