import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../Data/models/sign_in_model.dart';
import '../../Data/models/sign_up_model.dart';

abstract class AuthRepo {
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
}
