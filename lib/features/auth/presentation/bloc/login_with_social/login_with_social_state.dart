part of 'login_with_social_bloc.dart';

abstract class LoginWithSocialState extends Equatable {
  const LoginWithSocialState();

  @override
  List<Object> get props => [];
}

class LoginWithSocialInitial extends LoginWithSocialState {}

class LoginWithSocialLoading extends LoginWithSocialState {}

class LoginWithSocialError extends LoginWithSocialState {
  final String message;
  const LoginWithSocialError(this.message);
}

class LoginWithSocialSuccess extends LoginWithSocialState {
  final AuthEntity data;
  const LoginWithSocialSuccess(this.data);
}
