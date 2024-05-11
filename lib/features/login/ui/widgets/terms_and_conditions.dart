import 'package:flutter/material.dart';
import 'package:space_x/core/thiming/styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text:  TextSpan(children: [
        const TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font13GreyRegular),
        TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyles.font14DarkBlueMedium.copyWith(fontSize: 13)),
        const TextSpan(
            text: 'and ',
            style: TextStyles.font13GreyRegular),
             TextSpan(
            text: 'Privacy Policy ',
            style: TextStyles.font14DarkBlueMedium.copyWith(fontSize: 13)),
      ]),
    );
  }
}
