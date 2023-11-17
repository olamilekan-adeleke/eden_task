import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_locators.dart';
import '../../../../cores/component/custom_scaffold_widget.dart';
import '../../../../cores/component/custom_text_widget.dart';
import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_size.dart';
import '../../../../cores/helper/space_helper.dart';
import '../../domain/enums/order_status_enum.dart';
import '../bloc/get_channel_messages/get_channel_messages_bloc.dart';

class OrderStatusView extends StatelessWidget {
  static const String routeName = "order-status-view";
  const OrderStatusView({super.key});

  static final _getChannelMessageBloc = getIt<GetChannelMessagesBloc>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        title: const TextWidget.bold("Order Timeline"),
        backgroundColor: AppColor.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.black),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        verticalSpace(),
        const TextWidget.bold("Order Status History"),
        const TextWidget.light(
          "Below is the timeline for order #32122",
          size: kfsVeryTiny,
          height: 1.3,
        ),
        verticalSpace(20),
        BlocBuilder<GetChannelMessagesBloc, GetChannelMessagesState>(
          bloc: _getChannelMessageBloc,
          builder: (context, state) {
            OrderStatus orderStatus = OrderStatus.orderPlaced;
            if (state is GetChannelMessagesSuccess) {
              orderStatus = state.data;
            } else if (state is GetChannelMessagesError) {
              orderStatus = OrderStatus.unknown;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                timelineWidget(
                  OrderStatus.orderPlaced,
                  active: orderStatus.isGreater(OrderStatus.orderPlaced),
                  current: orderStatus == OrderStatus.orderPlaced,
                ),
                nextLineWidget(),
                timelineWidget(
                  OrderStatus.orderAccepted,
                  active: orderStatus.isGreater(OrderStatus.orderAccepted),
                  current: orderStatus == OrderStatus.orderAccepted,
                ),
                nextLineWidget(),
                timelineWidget(
                  OrderStatus.orderPickUpInProgress,
                  active:
                      orderStatus.isGreater(OrderStatus.orderPickUpInProgress),
                  current: orderStatus == OrderStatus.orderPickUpInProgress,
                ),
                nextLineWidget(),
                timelineWidget(
                  OrderStatus.orderOnTheWayToCustomer,
                  active: orderStatus
                      .isGreater(OrderStatus.orderOnTheWayToCustomer),
                  current: orderStatus == OrderStatus.orderOnTheWayToCustomer,
                ),
                nextLineWidget(),
                timelineWidget(
                  OrderStatus.orderDelivered,
                  active: orderStatus.isGreater(OrderStatus.orderDelivered),
                  current: orderStatus == OrderStatus.orderDelivered,
                ),
              ],
            );
          },
        ),
      ]),
    );
  }

  Widget timelineWidget(OrderStatus orderStatus,
      {active = false, current = false}) {
    return Container(
      width: sw(100),
      padding: symmetricPadding(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.primaryColorLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(sr(8)),
        border: Border.all(
          color: () {
            if (active) return AppColor.primaryColor;
            if (current) return AppColor.warningColor;

            return AppColor.dividerColor;
          }(),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextWidget.bold(
            "Order ${orderStatus.title}",
            withOpacity: (active || current) ? 1 : 0.3,
          ),
          Icon(
            () {
              if (active) return Icons.check_circle;
              if (current) return Icons.timelapse_rounded;

              return Icons.more_horiz;
            }(),
            color: () {
              if (active) return AppColor.primaryColor;
              if (current) return AppColor.warningColor;

              return AppColor.dividerColor;
            }(),
          ),
        ]),
        verticalSpace(3),
        Visibility(
          visible: (active || current),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget.light(
                orderStatus.description,
                withOpacity: (active || current) ? 1 : 0.3,
                size: kfsVeryTiny,
              ),
              verticalSpace(),
              TextWidget.light(
                "Friday, May 30th 2023. 2:30 pm",
                size: kfsVeryTiny,
                withOpacity: (active || current) ? 0.7 : 0.5,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget nextLineWidget() {
    return Center(
      child: Container(
        margin: symmetricPadding(vertical: 5),
        height: h(20),
        width: 1,
        color: AppColor.dividerColor,
      ),
    );
  }
}
