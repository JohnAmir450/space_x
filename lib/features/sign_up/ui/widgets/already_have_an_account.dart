
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/thiming/styles.dart';

import '../../../../core/routing/routes.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font14DarkBlueMedium,
          ),
          TextSpan(
            text: ' Login',
            style: TextStyles.font14BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}