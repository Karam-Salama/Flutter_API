import '../../Data/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

// ! ============= Get user data =============
final class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
