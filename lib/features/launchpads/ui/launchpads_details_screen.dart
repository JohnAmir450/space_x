import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/features/launchpads/data/models/launchpads_model/launchpads_model.dart';
import 'package:space_x/features/launchpads/ui/widgets/custom_scrollable_launchpads_app_bar.dart';
import 'package:space_x/features/launchpads/ui/widgets/launchpads_details_section.dart';

class LaunchPadsDetailsScreen extends StatelessWidget {
  final LaunchpadsModel launchpadsModel;
  const LaunchPadsDetailsScreen({super.key, required this.launchpadsModel});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomScrollableLaunchpadsAppBar(launchpadsModel: launchpadsModel,),
          SliverToBoxAdapter(child: LaunchpadsDetailsSection(launchpadsModel: launchpadsModel),)
        ],
      ),
    );
  }
}


