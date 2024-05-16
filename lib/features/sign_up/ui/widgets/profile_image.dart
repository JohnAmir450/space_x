import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            state is PickedPhotoState
                ? CircleAvatar(
                    radius: 90.h,
                    backgroundImage: FileImage(File(state.profileImagePath)))
                : CircleAvatar(
                    radius: 90.h,
                    backgroundImage: const AssetImage(
                        'assets/images/default_profile_image.jpg'),
                  ),
            GestureDetector(
              onTap: () {
                context.read<SignUpCubit>().pickImage();
              },
              child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add_a_photo_outlined)),
            )
          ],
        );
      },
    );
  }
}
