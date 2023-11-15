import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../cores/usecase/params.dart';
import '../../../domain/entities/auth_entity.dart';
import '../../../domain/usecases/login_with_github_usecase.dart';
import '../../../domain/usecases/login_with_google_usecase.dart';

part 'login_with_social_event.dart';
part 'login_with_social_state.dart';

class LoginWithSocialBloc
    extends Bloc<LoginWithSocialEvent, LoginWithSocialState> {
  final LoginWithGoogleUsecase loginWithGoogleUsecase;
  final LoginWithGithubUsecase loginWithGithubUsecase;

  LoginWithSocialBloc({
    required this.loginWithGoogleUsecase,
    required this.loginWithGithubUsecase,
  }) : super(LoginWithSocialInitial()) {
    on<LoginWithSocialEvent>((event, emit) {});

    on<LoginWithGoogle>((event, emit) async {
      emit(LoginWithSocialLoading());

      final result = await loginWithGoogleUsecase.call(const NoParams());

      result.fold(
        (failure) => emit(LoginWithSocialError(failure.message)),
        (auth) => emit(LoginWithSocialSuccess(auth)),
      );
    });

    on<LoginWithGithub>((event, emit) async {
      emit(LoginWithSocialLoading());

      final result = await loginWithGithubUsecase.call(const NoParams());

      result.fold(
        (failure) => emit(LoginWithSocialError(failure.message)),
        (auth) => emit(LoginWithSocialSuccess(auth)),
      );
    });
  }
}
