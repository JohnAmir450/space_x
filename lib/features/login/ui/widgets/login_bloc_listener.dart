import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/helpers/snak_bar_view.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/core/thiming/colors.dart';
import 'package:space_x/features/login/logic/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginCubitLoading ||
          current is LoginCubitSuccess ||
          current is LoginCubitFailure,
      listener: (context, state) {
        if (state is LoginCubitSuccess) {
          showSnackBar(context,
              text: 'Logged in Successfully', color: Colors.green);

          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is LoginCubitFailure) {
          return showSnackBar(context,
              text: state.errorMessage, color: Colors.red);
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
