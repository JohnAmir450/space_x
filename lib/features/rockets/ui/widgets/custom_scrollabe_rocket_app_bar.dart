import 'package:flutter/material.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/features/rockets/logic/models/rocket_model/rocket_model.dart';

class CustomScrollableRocketAppBar extends StatelessWidget {
  const CustomScrollableRocketAppBar({
    super.key,
    required this.rocketModel,
  });

  final RocketModel rocketModel;

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
          padding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          decoration: BoxDecoration(
            border:
                Border.all(color: ColorsManager.purple.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Text(rocketModel.name!,
              style: TextStyles.font16WhiteSemiBold
                  .copyWith(color: ColorsManager.purple)),
        ),
        background: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            rocketModel.flickrImages![0],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
