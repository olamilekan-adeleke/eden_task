import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;

import '../../../../../cores/try_catch_helper/logger.dart';
import '../../../domain/enums/order_status_enum.dart';
import '../../../domain/usecases/get_channel_usecae.dart';

part 'get_channel_messages_event.dart';
part 'get_channel_messages_state.dart';

class GetChannelMessagesBloc
    extends Bloc<GetChannelMessagesEvent, GetChannelMessagesState> {
  final GetChannelUsecase getChannelsUsecase;

  static const String _channelName = "eden_order_timeline";

  GetChannelMessagesBloc({required this.getChannelsUsecase})
      : super(GetChannelMessagesInitial()) {
    on<GetChannelMessagesEvent>((event, emit) {});

    on<InitMessages>((event, emit) async {
      emit(const GetChannelMessagesSuccess(OrderStatus.orderPlaced));
      emit(GetChannelMessagesLoading());

      final result = await getChannelsUsecase.call(_channelName);
      result.fold(
        (l) => emit(GetChannelMessagesError(l.message)),
        (r) => subscribeToChatChannel(r),
      );
    });

    on<PushMessages>((event, emit) async {
      emit(GetChannelMessagesSuccess(event.orderStatus));
    });
  }

  Future<void> subscribeToChatChannel(ably.RealtimeChannel chatChannel) async {
    var messageStream = chatChannel.subscribe();

    messageStream.listen((ably.Message message) {
      LoggerHelper.log(message.toString());
      final status = stringToOrderStatus(message.data.toString());
      add(PushMessages(status));
    });

    final ably.PaginatedResult<ably.Message> history =
        await chatChannel.history();
    if (history.items.isNotEmpty) {
      LoggerHelper.log("History:: ${history.items.toString()}");

      final message = history.items.first.data.toString();
      final status = stringToOrderStatus(message);
      add(PushMessages(status));
    }
  }
}
