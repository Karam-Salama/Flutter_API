import 'package:dartz/dartz.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../../Domain/repo/user_repo.dart';
import '../models/user_model.dart';

class UserRepoImplementation extends UserRepo {
  final ApiConsumer api;
  UserRepoImplementation({required this.api});
  @override
  Future<Either<String, UserModel>> getUserProfileData() async {
    try {
      final response = await api.get(
        EndPoint.getUserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
