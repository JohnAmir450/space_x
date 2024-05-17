import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/core/widgets/custom_detalis_list_tile.dart';
import 'package:space_x/features/crews/data/models/crew_model.dart';
import 'package:space_x/features/crews/logic/crew_cubit/crew_cubit.dart';

class CrewDetailsScreen extends StatelessWidget {
  final CrewModel crewModel;
  const CrewDetailsScreen({super.key, required this.crewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            expandedHeight: MediaQuery.sizeOf(context).height / 1.5,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(),
              title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.purple.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  crewModel.name!,
                  style: TextStyles.font16WhiteSemiBold,
                ),
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  crewModel.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(12.h),
              margin: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.purple),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'OverView',
                    style: TextStyles.font15DarkBlueMedium,
                  ),
                  verticalSpace(16.h),
                  CustomDetailsListTile(
                      title: 'Agency', trailing: crewModel.agency!),
                  verticalSpace(8.h),
                  CustomDetailsListTile(
                    title: 'Status',
                    trailing: crewModel.status!,
                    textStyle: crewModel.status == 'active'
                        ? TextStyles.font16WhiteSemiBold
                            .copyWith(color: Colors.green)
                        : TextStyles.font16WhiteSemiBold
                            .copyWith(color: Colors.red),
                  ),
                  verticalSpace(8.h),
                  CustomDetailsListTile(
                      title: 'Number of launches',
                      trailing: crewModel.launches!.length.toString()),
                  verticalSpace(8.h),
                  Row(
                    children: [
                      const Text(
                        'For more information :',
                        style: TextStyles.font14DarkBlueMedium,
                      ),
                      horizontalSpace(15.w),
                      GestureDetector(
                        onTap: (){
                          context.read<CrewCubit>().fetchLink(context,link: crewModel.wikipedia!);
                        },
                        child: const Text(
                          'Click Here',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
