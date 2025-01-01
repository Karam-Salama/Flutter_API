import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/sign_in_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../core/api/api_consumer.dart';
import '../core/api/end_points.dart';
import '../core/errors/exceptions.dart';
import '../core/functions/upload_image_to_api.dart';
import '../models/sign_up_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.apiConsumer}) : super(UserInitial());
  ApiConsumer apiConsumer;
  SignInModel? user;
  SignUpModel? signUpModel;

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

  signIn() async {
    emit(SignInLoading());
    try {
      final response = await apiConsumer.post(
        EndPoints.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errorMessage: e.errorModel.errorMessage));
    }
  }

  signUp() async {
    emit(SignUpLoading());
    try {
      final response = await apiConsumer.post(
        EndPoints.signUp,
        isFormData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.phone: signUpPhoneNumber.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.confirmPassword: confirmPassword.text,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.image: await uploadImageToAPI(profilePic!),
        },
      );
      signUpModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(message: signUpModel!.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errorMessage: e.errorModel.errorMessage));
    }
  }

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePicSuccess());
  }
}
