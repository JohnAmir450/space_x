import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/core/widgets/custom_error_state_text.dart';
import 'package:space_x/features/home/ui/widgets/blurred_back_gorund.dart';
import 'package:space_x/features/launchpads/logic/launchpdas_cubit/launchpads_cubit.dart';
import 'package:space_x/features/launchpads/ui/widgets/launchpads_List_view_item.dart';
import 'package:space_x/features/rockets/ui/widgets/custom_shimmer_container.dart';

class LaunchpadsScreen extends StatelessWidget {
  const LaunchpadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredBackGroundImage(
          bodyWidgets: BlocBuilder<LaunchpadsCubit, LaunchpadsState>(
        builder: (context, state) {
          if (state is LaunchpadsSuccessState) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.launchpads.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(top: 15.h, right: 12.h),
                      child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.launchpadsDetailsScreen,
                                arguments: state.launchpads[index]);
                          },
                          child: LaunchpadsListViewItem(
                            launchpadsModel: state.launchpads[index],
                          )),
                    ));
          } else if (state is LaunchpadsFailureState) {
            return CustomErrorStateMessage(errorText: state.errorMessage);
          } else {
            return Shimmer.fromColors(
                baseColor: Colors.purple,
                highlightColor: Colors.blue,
                child: const ShimmerCustomContainer(
                  height: 350,
                  width: 350,
                ));
          }
        },
      )),
    );
  }
}
