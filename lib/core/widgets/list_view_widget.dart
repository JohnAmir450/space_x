import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/features/rockets/logic/models/rocket_model/rocket_model.dart';

class ListViewWidget extends StatelessWidget {
  final RocketModel rocketModel;
  const ListViewWidget({
    super.key,
    required this.rocketModel,
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
                rocketModel.name!,
                style: TextStyles.font16WhiteSemiBold
                    .copyWith(color: ColorsManager.purple, fontSize: 18),
              ),
              verticalSpace(40),
              ListTile(
                title: const Text(
                  'Number of Stages :',
                  style: TextStyles.font15DarkBlueMedium,
                ),
                trailing: Text(rocketModel.stages.toString(),
                    style: TextStyles.font15DarkBlueMedium),
              ),
              verticalSpace(6.h),
              ListTile(
                title: const Text(
                  'Number of Boosters :',
                  style: TextStyles.font15DarkBlueMedium,
                ),
                trailing: Text(rocketModel.boosters.toString(),
                    style: TextStyles.font15DarkBlueMedium),
              ),
              verticalSpace(6.h),
              ListTile(
                title: const Text(
                  'Active',
                  style: TextStyles.font15DarkBlueMedium,
                ),
                trailing: rocketModel.active == true
                    ? Text(rocketModel.active.toString(),
                        style: TextStyles.font15DarkBlueMedium
                            .copyWith(color: Colors.green))
                    : Text(rocketModel.active.toString(),
                        style: TextStyles.font15DarkBlueMedium
                            .copyWith(color: Colors.red)),
              ),
              Transform.translate(
                offset: const Offset(0, 60),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 30,
                          ))),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    rocketModel.company!,
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
              backgroundImage: NetworkImage(rocketModel.flickrImages![0]),
            ),
          ),
        )
      ],
    );
  }
}
