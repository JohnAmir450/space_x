import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/app_regex.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/widgets/custom_text_form_field.dart';
import 'package:space_x/features/login/logic/login_cubit/login_cubit.dart';
import 'package:space_x/features/login/ui/widgets/password_validations.dart';

class PasswordAndEmail extends StatefulWidget {
  const PasswordAndEmail({super.key});

  @override
  State<PasswordAndEmail> createState() => _PasswordAndEmailState();
}

class _PasswordAndEmailState extends State<PasswordAndEmail> {
  bool isObscurePassword = true;
  late TextEditingController passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: context.read<LoginCubit>().emailController,
              onChanged: (data){
                  context.read<LoginCubit>().emailController.text=data;
              },
              hintText: 'Email',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              }),
          verticalSpace(18.h),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            onChanged: (data){
              passwordController.text=data;
            },
            isObscureText: isObscurePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
              child: Icon(isObscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
            ),
            hintText: 'Password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength)
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }
}
