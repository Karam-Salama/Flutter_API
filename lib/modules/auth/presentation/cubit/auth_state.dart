part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// ! ============== Sign In ==============
final class SignInSuccess extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInFailure extends AuthState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

// ! ============== Sign Up ==============
final class UploadProfilePic extends AuthState {}

final class SignUpSuccess extends AuthState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
