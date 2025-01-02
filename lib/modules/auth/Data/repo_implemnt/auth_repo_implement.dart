import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/functions/upload_image_to_api.dart';
import '../../Domain/repo/auth_repo.dart';
import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';

class AuthRepoImplement extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImplement({required this.api});

  @override
  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required XFile profilePic,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.name: name,
          ApiKey.phone: phone,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.profilePic: await uploadImageToAPI(profilePic)
        },
      );
      final signUPModel = SignUpModel.fromJson(response);
      return Right(signUPModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
