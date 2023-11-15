part of 'login_with_social_bloc.dart';

abstract class LoginWithSocialEvent extends Equatable {
  const LoginWithSocialEvent();

  @override
  List<Object> get props => [];
}

class LoginWithGoogle extends LoginWithSocialEvent {}

class LoginWithGithub extends LoginWithSocialEvent {
  final LoginWithGithubParam param;

  const LoginWithGithub(this.param);
}
