import 'package:dartz/dartz.dart';

import '../../Data/models/user_model.dart';

abstract class UserRepo {
  Future<Either<String, UserModel>> getUserProfileData();
}
