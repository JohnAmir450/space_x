import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/thiming/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      this.buttonHeight,
      required this.onPressed,
      required this.buttonText,
      required this.textStyle});
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final String buttonText;
  final TextStyle textStyle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 16))),
          backgroundColor: MaterialStatePropertyAll(
              backgroundColor ?? ColorsManager.mainBlue),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12.w,
              vertical: verticalPadding ?? 14.h)),
          fixedSize: MaterialStateProperty.all(
              Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50.h))),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
