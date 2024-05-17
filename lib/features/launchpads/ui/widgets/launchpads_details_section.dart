import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/core/widgets/custom_detalis_list_tile.dart';
import 'package:space_x/features/launchpads/data/models/launchpads_model/launchpads_model.dart';

class LaunchpadsDetailsSection extends StatelessWidget {
  final LaunchpadsModel launchpadsModel;
  const LaunchpadsDetailsSection({
    super.key,
    required this.launchpadsModel,
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
          Text(launchpadsModel.details!),
          verticalSpace(16),
          CustomDetailsListTile(
            title: 'Name',
            trailing: launchpadsModel.name!,
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'Timezone',
            trailing: launchpadsModel.timezone!,
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'Locality',
            trailing: launchpadsModel.locality!,
          ),verticalSpace(8),
          CustomDetailsListTile(
            title: 'Region',
            trailing: launchpadsModel.region!,
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'Launch attempts',
            trailing: launchpadsModel.launchAttempts!.toString(),
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'Launch successes',
            trailing: launchpadsModel.launchSuccesses!.toString(),
          ),
           verticalSpace(8),
          CustomDetailsListTile(
            title: 'Number of rockets',
            trailing: launchpadsModel.rockets!.length.toString(),
          ),
          verticalSpace(8),
          CustomDetailsListTile(
            title: 'status : ',
            trailing: launchpadsModel.status.toString(),
            textStyle: launchpadsModel.status == 'active'
                ? TextStyles.font16WhiteSemiBold.copyWith(color: Colors.green)
                : TextStyles.font16WhiteSemiBold.copyWith(color: Colors.red),
          ),
          verticalSpace(8),
        ],
      ),
    );
  }
}
