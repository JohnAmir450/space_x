import 'package:flutter/material.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/core/thiming/styles.dart';

class CustomDetailsListTile extends StatelessWidget {
  final String title;
  final String trailing;
  final TextStyle? textStyle;

  const CustomDetailsListTile({
    super.key,
    required this.title,
    required this.trailing,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.purple),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.font14DarkBlueMedium,
          ),
          Text(trailing, style: textStyle),
        ],
      ),
    );
  }
}
