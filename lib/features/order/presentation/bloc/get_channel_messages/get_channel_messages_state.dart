part of 'get_channel_messages_bloc.dart';

abstract class GetChannelMessagesState extends Equatable {
  const GetChannelMessagesState();

  @override
  List<Object> get props => [];
}

class GetChannelMessagesInitial extends GetChannelMessagesState {}

class GetChannelMessagesLoading extends GetChannelMessagesState {}

class GetChannelMessagesError extends GetChannelMessagesState {
  final String message;
  const GetChannelMessagesError(this.message);
}

class GetChannelMessagesSuccess extends GetChannelMessagesState {
  final OrderStatus data;
  const GetChannelMessagesSuccess(this.data);

  @override
  List<Object> get props => [data.hashCode];
}
