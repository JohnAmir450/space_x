
import 'package:flutter/material.dart';

import 'package:space_x/core/thiming/font_helper.dart';
import 'package:space_x/core/thiming/styles.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.font14DarkBlueMedium),
        TextSpan(
          // recognizer: TapGestureRecognizer()..onTap=(){
          //   context.pushReplacementNamed(Routes.signUpScreen);
          // },
            text: 'Sign Up',
            style: TextStyles.font13BlueRegular
                .copyWith(fontWeight: FontWeightHelper.semiBold)),
            
      ]
      
      ),
    );
  }
}
