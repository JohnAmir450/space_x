import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/thiming/styles.dart';
import 'package:space_x/core/widgets/custom_text_button.dart';
import 'package:space_x/features/login/logic/login_cubit/login_cubit.dart';
import 'package:space_x/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:space_x/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:space_x/features/login/ui/widgets/password_and_email.dart';
import 'package:space_x/features/login/ui/widgets/terms_and_conditions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyles.font32BlueBold,
              ),
              verticalSpace(8.0.h),
              const Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GreyRegular,
              ),
              verticalSpace(36.h),
              Column(
                children: [
                  const PasswordAndEmail(),
                  verticalSpace(40),
                  CustomTextButton(
                      onPressed: ()async{
                        if(context.read<LoginCubit>().formKey.currentState!.validate()){
                          context.read<LoginCubit>().login();
                        }
                      },
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold),
                       verticalSpace(16.h),
                    const TermsAndConditions(),
                    verticalSpace(60),
                    const DontHaveAnAccount(),
                    const LoginBlocListener()
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
