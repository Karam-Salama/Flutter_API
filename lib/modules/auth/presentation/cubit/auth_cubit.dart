import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../Data/models/sign_in_model.dart';
import '../../Data/repo_implemnt/auth_repo_implement.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoImplementation) : super(AuthInitial());
  final AuthRepoImplement authRepoImplementation;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignInModel? user;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await authRepoImplementation.signUp(
      name: signUpName.text,
      phone: signUpPhoneNumber.text,
      email: signUpEmail.text,
      password: signUpPassword.text,
      confirmPassword: confirmPassword.text,
      profilePic: profilePic!,
    );
    response.fold(
      (errorMessage) => emit(SignUpFailure(errMessage: errorMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }

  signIn() async {
    emit(SignInLoading());
    final response = await authRepoImplementation.signIn(
      email: signInEmail.text,
      password: signInPassword.text,
    );
    response.fold(
      (errorMessage) => emit(SignInFailure(errMessage: errorMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }
}
