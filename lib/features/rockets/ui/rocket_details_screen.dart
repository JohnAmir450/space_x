import 'package:flutter/material.dart';
import 'package:space_x/features/rockets/ui/widgets/rocket_details_section.dart';
import 'package:space_x/features/rockets/logic/models/rocket_model/rocket_model.dart';
import 'package:space_x/features/rockets/ui/widgets/custom_scrollabe_rocket_app_bar.dart';

class RocketDetailsScreen extends StatelessWidget {
  final RocketModel rocketModel;
  const RocketDetailsScreen({super.key, required this.rocketModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomScrollableRocketAppBar(rocketModel: rocketModel),
          SliverToBoxAdapter(
            child: RocketDetailsSection(
              rocketModel: rocketModel,
            ),
          )
        ],
      ),
    );
  }
}
