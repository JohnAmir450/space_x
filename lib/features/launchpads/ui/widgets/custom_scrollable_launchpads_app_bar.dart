import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/features/launchpads/data/models/launchpads_model/launchpads_model.dart';

class CustomScrollableLaunchpadsAppBar extends StatelessWidget {
  const CustomScrollableLaunchpadsAppBar({
    super.key,
    required this.launchpadsModel,
  });

  final LaunchpadsModel launchpadsModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const CircleAvatar(
          backgroundColor: ColorsManager.purple,
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
        titlePadding: const EdgeInsets.only(),
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.purple.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Text('launchpadsModel',
              style: TextStyles.font16WhiteSemiBold
                  .copyWith(color: ColorsManager.purple)),
        ),
        background: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            launchpadsModel.images!.large![0],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
