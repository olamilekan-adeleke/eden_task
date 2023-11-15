import 'package:google_sign_in/google_sign_in.dart';

import '../../app/app_locators.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/login_with_github_usecase.dart';
import 'domain/usecases/login_with_google_usecase.dart';
import 'presentation/bloc/login_with_social/login_with_social_bloc.dart';

void setUpAuthLocator() {
  // remote data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(googleSignIn: GoogleSignIn()),
  );

  // repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: getIt<AuthRemoteDataSource>()),
  );

  // use case
  getIt.registerLazySingleton<LoginWithGoogleUsecase>(
    () => LoginWithGoogleUsecase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<LoginWithGithubUsecase>(
    () => LoginWithGithubUsecase(repository: getIt<AuthRepository>()),
  );

  // bloc
  getIt.registerLazySingleton<LoginWithSocialBloc>(
    () => LoginWithSocialBloc(
      loginWithGithubUsecase: getIt<LoginWithGithubUsecase>(),
      loginWithGoogleUsecase: getIt<LoginWithGoogleUsecase>(),
    ),
  );
}
