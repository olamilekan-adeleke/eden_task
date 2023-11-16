import 'package:flutter/material.dart';

import '../../../../cores/component/custom_scaffold_widget.dart';
import '../../../../cores/component/custom_text_widget.dart';
import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_size.dart';
import '../../../../cores/helper/space_helper.dart';

class OrderStatusView extends StatelessWidget {
  static const String routeName = "order-status-view";
  const OrderStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      // useSingleScroll: false,
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
        timelineWidget(
          "Placed",
          "Waiting for the vendor to accept your order.",
          active: true,
        ),
        nextLineWidget(),
        timelineWidget(
          "Accepted",
          "Waiting for the vendor to accept your order.",
          active: true,
        ),
        nextLineWidget(),
        timelineWidget(
          "PICK UP IN PROGRESS",
          "Waiting for the vendor to accept your order.",
          current: true,
        ),
        nextLineWidget(),
        timelineWidget(
          "PICK UP IN PROGRESS",
          "Waiting for the vendor to accept your order.",
        ),
        nextLineWidget(),
        timelineWidget(
          "PICK UP IN PROGRESS",
          "Waiting for the vendor to accept your order.",
        ),
      ]),
    );
  }

  Widget timelineWidget(
    String status,
    String value, {
    active = false,
    current = false,
  }) {
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
            "Order $status",
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
        TextWidget.light(value, withOpacity: (active || current) ? 1 : 0.3),
        verticalSpace(),
        Visibility(
          visible: (active || current),
          child: TextWidget.light(
            "Friday, May 30th 2023. 2:30 pm",
            size: kfsVeryTiny,
            withOpacity: (active || current) ? 1 : 0.5,
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
