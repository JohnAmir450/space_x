import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/helpers/snak_bar_view.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showSnackBar(context,
              text: 'Signed Up Successfully', color: Colors.green);
          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is PickedPhotoState) {
          showSnackBar(context,
              text: 'Photo Selected', color: ColorsManager.mainBlue);
        } else if (state is ChangePasswordVisibilityState) {
        } else if (state is SignUpFailureState) {
          showSnackBar(context, text: state.errorMessage, color: Colors.red);
        } else {
          showDialog(
              context: context,
              builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ),
                  ));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
