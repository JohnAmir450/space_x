import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/core/widgets/custom_detalis_list_tile.dart';
import 'package:space_x/features/rockets/logic/models/rocket_model/rocket_model.dart';

class RocketDetailsSection extends StatelessWidget {
  final RocketModel rocketModel;
  const RocketDetailsSection({
    super.key,
    required this.rocketModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(12.0.h),
      margin: EdgeInsetsDirectional.all(12.0.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyles.font15DarkBlueMedium,
          ),
          verticalSpace(16.h),
          Text(rocketModel.description!),
          verticalSpace(16),
          CustomDetailsListTile(
            title: 'height',
            trailing: '${rocketModel.height!.meters} M',
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'mass',
            trailing: '${rocketModel.mass!.kg} Kg',
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'reusable',
            trailing: rocketModel.active.toString(),
            textStyle: rocketModel.active == true
                ? TextStyles.font16WhiteSemiBold.copyWith(color: Colors.green)
                : TextStyles.font16WhiteSemiBold.copyWith(color: Colors.red),
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'Number of engines',
            trailing: rocketModel.secondStage!.engines.toString(),
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'number of Stages',
            trailing: rocketModel.stages!.toString(),
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'number of boosters',
            trailing: rocketModel.boosters.toString(),
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'cost per launch',
            trailing: rocketModel.costPerLaunch.toString(),
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'success rate',
            trailing: '${rocketModel.successRatePct} %',
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'first flight',
            trailing: rocketModel.firstFlight!,
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'Type',
            trailing: rocketModel.type!,
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'Fuel amount tons',
            trailing: rocketModel.secondStage!.fuelAmountTons.toString(),
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'Burn time per second',
            trailing: rocketModel.secondStage!.burnTimeSec.toString(),
          ),
          verticalSpace(8),
        ],
      ),
    );
  }
}
