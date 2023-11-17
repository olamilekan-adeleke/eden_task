import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_locators.dart';

import '../../../../cores/component/custom_scaffold_widget.dart';
import '../../../../cores/helper/space_helper.dart';
import '../../../auth/domain/entities/auth_entity.dart';
import '../../domain/enums/order_status_enum.dart';
import '../bloc/get_channel_messages/get_channel_messages_bloc.dart';
import '../widgets/order_summary_widget.dart';
import '../widgets/order_view_header_widget.dart';

class OrderHomeView extends StatefulWidget {
  static const String routeName = "order-home-view";

  final UserDetails userData;
  const OrderHomeView(this.userData, {super.key});

  @override
  State<OrderHomeView> createState() => _OrderHomeViewState();
}

class _OrderHomeViewState extends State<OrderHomeView> {
  final _getChannelMessageBloc = getIt<GetChannelMessagesBloc>();

  @override
  void initState() {
    super.initState();
    _getChannelMessageBloc.add(InitMessages());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(children: [
        verticalSpace(),
        OrderViewHeaderWidget(widget.userData),
        BlocBuilder<GetChannelMessagesBloc, GetChannelMessagesState>(
          bloc: _getChannelMessageBloc,
          builder: (context, state) {
            OrderStatus orderStatus = OrderStatus.orderPlaced;
            if (state is GetChannelMessagesSuccess) {
              orderStatus = state.data;
            } else if (state is GetChannelMessagesError) {
              orderStatus = OrderStatus.unknown;
            }

            return OrderSummaryWidget(orderStatus);
          },
        ),
      ]),
    );
  }
}
