part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpBusinessLoading extends AuthState {}

final class SignUpBusinessSuccess extends AuthState {
  final SignUpBussinessModel signUpBussinessModel;

  SignUpBusinessSuccess({required this.signUpBussinessModel});
}

final class SignUpBusinessFailed extends AuthState {
  final String error;

  SignUpBusinessFailed({required this.error});
}

final class SignUpInfluencerLoading extends AuthState {}

final class SignUpInfluencerSuccess extends AuthState {
  final SignUpInfluencerModel signUpInfluencerModel;

  SignUpInfluencerSuccess({required this.signUpInfluencerModel});
}

final class SignUpInfluencerFailed extends AuthState {
  final String error;

  SignUpInfluencerFailed({required this.error});
}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}

final class LoginFailed extends AuthState {
  final String error;

  LoginFailed({required this.error});
}

final class LogoutLoading extends AuthState {}

final class LogoutSuccess extends AuthState {
  final LogoutModel logoutModel;

  LogoutSuccess({required this.logoutModel});
}

final class LogoutFailed extends AuthState {
  final String error;

  LogoutFailed({required this.error});
}
