import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/core/widgets/custom_text_button.dart';
import 'package:space_x/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:space_x/features/sign_up/ui/widgets/already_have_an_account.dart';
import 'package:space_x/features/sign_up/ui/widgets/profile_image.dart';
import 'package:space_x/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:space_x/features/sign_up/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 30.h,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                const Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const ProfileImage(),
                    verticalSpace(24),
                    const SignUpForm(),
                    verticalSpace(30),
                    CustomTextButton(
                        onPressed: () {
                          if (context
                              .read<SignUpCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context.read<SignUpCubit>().register();
                          }
                        },
                        buttonText: 'Sign Up',
                        textStyle: TextStyles.font16WhiteSemiBold),
                    verticalSpace(40),
                    const AlreadyHaveAccountText(),
                    const SignUpBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
