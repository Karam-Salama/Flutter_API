import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/repo_implemnt/user_repo_implementation.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepoImplementation) : super(UserInitial());
  final UserRepoImplementation userRepoImplementation;

  getUserProfile() async {
    emit(GetUserLoading());
    final response = await userRepoImplementation.getUserProfileData();
    response.fold(
      (errorMessage) => emit(GetUserFailure(errMessage: errorMessage)),
      (userModel) => emit(GetUserSuccess(user: userModel)),
    );
  }
}
