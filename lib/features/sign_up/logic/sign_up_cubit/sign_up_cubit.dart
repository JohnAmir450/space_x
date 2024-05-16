import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:space_x/core/helpers/cache_helpers.dart';
import 'package:space_x/core/helpers/cache_keys.dart';
import 'package:space_x/core/models/user_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  XFile? pickedImage;

  Icon suffix = const Icon(Icons.visibility_outlined);
  bool isObscurePassword = true;
  void changePasswordVisibility() {
    isObscurePassword = !isObscurePassword;
    suffix = isObscurePassword
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    emit(ChangePasswordVisibilityState());
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      emit(PickedPhotoState(
          profileImagePath:
              pickedImage?.path ?? 'assets/images/default_profile_image.jpg'));
    } else {
      print('Image selection cancelled.');
    }
  }

  Future<void> register() async {
    emit(SignUpLoadingState());
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      UserModel userModel = UserModel(
          userName: userNameController.text,
          email: emailController.text,
          phoneNumber: passwordController.text,
          profileImage:
              pickedImage?.path ?? 'assets/images/default_profile_image.jpg');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(userModel.toMap());

      CacheHelper.saveData(key: CacheKeys.registerKey, value: true);

      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailureState(errorMessage: mapFirebaseAuthException(e)));
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }

  String mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'operation-not-allowed':
        return 'Email/password sign-in is disabled.';
      case 'user-deleted':
        return 'The user account has been deleted.';
      default:
        return 'An error occurred during registration (${e.code}).';
    }
  }
}
