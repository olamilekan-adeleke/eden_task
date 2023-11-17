import '../../app/app_locators.dart';
import 'data/datasources/order_data_sourse.dart';
import 'data/repositories/order_repository_impl.dart';
import 'domain/repositories/order_repository.dart';
import 'domain/usecases/get_channel_usecae.dart';
import 'presentation/bloc/get_channel_messages/get_channel_messages_bloc.dart';

void setUpOrderLocator() {
  getIt.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(remoteDataSource: getIt<OrderRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetChannelUsecase>(
    () => GetChannelUsecase(repository: getIt<OrderRepository>()),
  );

  //
  getIt.registerLazySingleton<GetChannelMessagesBloc>(
    () => GetChannelMessagesBloc(
      getChannelsUsecase: getIt<GetChannelUsecase>(),
    ),
  );
}
