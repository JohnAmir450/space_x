import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/features/rockets/ui/widgets/list_view_widget.dart';
import 'package:space_x/features/home/ui/widgets/blurred_back_gorund.dart';
import 'package:space_x/features/rockets/data/rocket_cubit/rocket_cubit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_x/features/rockets/ui/widgets/custom_shimmer_container.dart';

class RocketsScreen extends StatelessWidget {
  const RocketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlurredBackGroundImage(
      bodyWidgets: BlocBuilder<RocketCubit, RocketState>(
        builder: (context, state) {
          if (state is RocketSuccessState) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.rockets.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(top: 15.h, right: 6.h),
                      child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.rocketDetailsScreen,
                                arguments: state.rockets[index]);
                          },
                          child: RocketListViewItem(
                            rocketModel: state.rockets[index],
                          )),
                    ));
          } else if (state is RocketFailureState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Shimmer.fromColors(
                baseColor: Colors.purple,
                highlightColor: Colors.blue,
                child: ShimmerCustomContainer(
                  height: 350,
                  width: 350,
                ));
          }
        },
      ),
    ));
  }
}
