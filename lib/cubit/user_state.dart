class UserState {}

final class UserInitial extends UserState {}

final class SignInLoading extends UserState {}

final class SignInSuccess extends UserState {}

final class SignInFailure extends UserState {
  final String errorMessage;
  SignInFailure({required this.errorMessage});
}

final class SignUpLoading extends UserState {}

final class SignUpSuccess extends UserState {
  final String? message;
  SignUpSuccess({required this.message});
}

final class SignUpFailure extends UserState {
  final String errorMessage;
  SignUpFailure({required this.errorMessage});
}

final class UploadProfilePicSuccess extends UserState {}
