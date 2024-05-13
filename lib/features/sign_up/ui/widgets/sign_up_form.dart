import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/helpers/app_regex.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/widgets/custom_text_form_field.dart';
import 'package:space_x/features/login/ui/widgets/password_validations.dart';
import 'package:space_x/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  @override
  void initState() {
    passwordController = context.read<SignUpCubit>().passwordController;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Form(
          key: context.read<SignUpCubit>().formKey,
          child: Column(
            children: [
              CustomTextFormField(
                  controller: context.read<SignUpCubit>().userNameController,
                  onChanged: (data) {
                    context.read<SignUpCubit>().userNameController.text = data;
                  },
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                  }),
              verticalSpace(12),
              CustomTextFormField(
                  controller: context.read<SignUpCubit>().emailController,
                  onChanged: (data) {
                    context.read<SignUpCubit>().emailController.text = data;
                  },
                  hintText: 'Email',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'Please enter a valid email';
                    }
                  }),
              verticalSpace(12),
              CustomTextFormField(
                  keyboardType: TextInputType.phone,
                  controller: context.read<SignUpCubit>().phoneController,
                  onChanged: (data) {
                    context.read<SignUpCubit>().phoneController.text = data;
                  },
                  hintText: 'Phone Number',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isPhoneNumberValid(value)) {
                      return 'Please enter a valid phone number';
                    }
                  }),
              verticalSpace(12),
              CustomTextFormField(
                  controller: context.read<SignUpCubit>().passwordController,
                  isObscureText: context.read<SignUpCubit>().isObscurePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      context.read<SignUpCubit>().changePasswordVisibility();
                    },
                    child: context.read<SignUpCubit>().suffix,
                  ),
                  onChanged: (data) {
                    context.read<SignUpCubit>().passwordController.text = data;
                  },
                  hintText: 'Password',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isPasswordValid(value)) {
                      return 'Please enter a valid password';
                    }
                  }),
                  verticalSpace(8),
              PasswordValidations(
                  hasLowerCase: hasLowerCase,
                  hasUpperCase: hasUpperCase,
                  hasSpecialCharacters: hasSpecialCharacters,
                  hasNumber: hasNumber,
                  hasMinLength: hasMinLength)
            ],
          ),
        );
      },
    );
  }
}
