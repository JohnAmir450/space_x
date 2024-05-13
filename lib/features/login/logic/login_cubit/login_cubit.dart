import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:space_x/core/helpers/cache_helpers.dart';
import 'package:space_x/core/helpers/cache_keys.dart';



part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginCubitInitial());

  final formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  Future<void>login()async{
    emit(LoginCubitLoading());
  try {
  final credential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text,
   password: passwordController.text);
   await CacheHelper.saveData(key: CacheKeys.loginKey,value: true);
   emit(LoginCubitSuccess());
} on FirebaseAuthException catch (e) {
  emit(LoginCubitFailure(errorMessage: mapFirebaseAuthException(e)));
}catch(e){
  emit(LoginCubitFailure(errorMessage: e.toString()));
}

  }

  String mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'The email address is not registered.';
      case 'wrong-password':
        return 'The password is incorrect.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'Email/password sign-in is disabled.';
      default:
        return 'An error occurred during login (${e.code}).';
    }
  }
}
