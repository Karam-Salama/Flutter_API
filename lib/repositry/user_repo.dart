import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';

abstract class UserRepo {
  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required XFile profilePic,
  });

  Future<Either<String, UserModel>> getUserProfileData();
}
