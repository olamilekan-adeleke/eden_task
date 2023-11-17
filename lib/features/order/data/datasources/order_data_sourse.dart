import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';

import '../../../../cores/try_catch_helper/logger.dart';

abstract class OrderRemoteDataSource {
  Future<ably.RealtimeChannel> getChannel(String name);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  @override
  Future<ably.RealtimeChannel> getChannel(String name) async {
    const String channelName = "eden_order_timeline";
    final String myRandomClientId = const Uuid().v4();
    final String? apiKey = dotenv.env['ABLY_API_KEY'];

    final clientOptions = ably.ClientOptions(key: apiKey);
    clientOptions.clientId = myRandomClientId;

    final ably.Realtime realtimeInstance = ably.Realtime(
      options: clientOptions,
    );
    LoggerHelper.log('Ably instantiated');

    final ably.RealtimeChannel chatChannel = realtimeInstance.channels.get(
      channelName,
    );
    return chatChannel;
  }
}
