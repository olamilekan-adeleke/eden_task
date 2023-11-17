part of 'get_channel_messages_bloc.dart';

abstract class GetChannelMessagesEvent extends Equatable {
  const GetChannelMessagesEvent();

  @override
  List<Object> get props => [];
}

class InitMessages extends GetChannelMessagesEvent {}

class PushMessages extends GetChannelMessagesEvent {
  final OrderStatus orderStatus;

  const PushMessages(this.orderStatus);
}
