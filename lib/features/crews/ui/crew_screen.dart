import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/core/widgets/custom_error_state_text.dart';
import 'package:space_x/features/crews/logic/crew_cubit/crew_cubit.dart';
import 'package:space_x/features/crews/ui/widgets/crew_list_view_item.dart';
import 'package:space_x/features/home/ui/widgets/blurred_back_gorund.dart';
import 'package:space_x/features/rockets/ui/widgets/custom_shimmer_container.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredBackGroundImage(
        bodyWidgets:
            BlocBuilder<CrewCubit, CrewState>(builder: (context, state) {
          if (state is CrewSuccessState) {
           
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemCount: state.crews.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(top: 15.h, right: 6.h),
                      child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.crewDetailsScreen,
                                arguments: state.crews[index]);
                          },
                          child: CrewListViewItem(
                            crewModel: state.crews[index],
                          )),
                    ));
                    
            
          } else if (state is CrewFailureState) {
             return  CustomErrorStateMessage(errorText: state.errorMessage,);
          } else {
            return Shimmer.fromColors(
                baseColor: Colors.purple,
                highlightColor: Colors.blue,
                child: const ShimmerCustomContainer(
                  height: 350,
                  width: 350,
                ));
          }
        }),
      ),
    );
  }
}

