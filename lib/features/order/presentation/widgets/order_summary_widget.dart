import 'package:flutter/material.dart';

import '../../../../cores/component/custom_text_widget.dart';
import '../../../../cores/component/image_widget.dart';
import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_size.dart';
import '../../../../cores/helper/space_helper.dart';
import '../../../../cores/navigator/app_router.dart';

import '../../domain/enums/order_status_enum.dart';
import '../pages/order_status_view.dart';

class OrderSummaryWidget extends StatelessWidget {
  final OrderStatus orderStatus;

  const OrderSummaryWidget(this.orderStatus, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _OrderItemWidget(orderStatus),
    ]);
  }
}

class _OrderItemWidget extends StatelessWidget {
  final OrderStatus orderStatus;
  const _OrderItemWidget(this.orderStatus);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: symmetricPadding(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.primaryColorLight.withOpacity(0.2),
        borderRadius: BorderRadius.circular(sr(8)),
      ),
      child: Column(children: [
        buildOrderDetails(),
        verticalSpace(5),
        const Divider(color: AppColor.dividerColor),
        verticalSpace(5),
        buildOrderInfoWidget("Order ID", "#32122"),
        buildOrderInfoWidget("Order Date", "Wed, Nov 30 2023"),
        buildOrderInfoWidget("Order Time", "2:35 pm"),
        buildOrderInfoWidget("Order Quantity", "x 1"),
        buildOrderInfoWidget("Order Total Price", "\u20A6 9,800"),
        const Divider(color: AppColor.dividerColor),
        verticalSpace(5),
        buildOrderStats(),
      ]),
    );
  }

  Widget buildOrderInfoWidget(String title, String value) {
    return Padding(
      padding: paddingOnly(bottom: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TextWidget.light(title),
        TextWidget.semibold(value, withOpacity: 0.8),
      ]),
    );
  }

  Widget buildOrderStats() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextWidget.bold(
        orderStatus.title,
        color: AppColor.warningColor,
        withOpacity: 0.7,
      ),
      verticalSpace(2),
      TextWidget.light(
        orderStatus.description,
        size: kfsVeryTiny,
        withOpacity: 0.7,
      ),
      horizontalSpace(sw(100)),
      verticalSpace(),
      // Stepper
      // SizedBox(height: h(20), child: const Placeholder()),
      verticalSpace(),
      GestureDetector(
        onTap: () => AppRouter.instance.navigateTo(OrderStatusView.routeName),
        child: Container(
          padding: symmetricPadding(horizontal: 5, vertical: 5),
          alignment: Alignment.center,
          child: const TextWidget.light(
            "Click To Track Your Order",
            decoration: TextDecoration.underline,
            size: kfsRegular,
            color: AppColor.infoColor,
          ),
        ),
      ),
    ]);
  }

  Widget buildOrderDetails() {
    return Row(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(sr(4)),
        child: ImageWidget(
          height: h(50),
          width: w(50),
          imageTypes: ImageTypes.asset,
          imageUrl: "assets/images/burger.jpg",
        ),
      ),
      horizontalSpace(5),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TextWidget.bold(
            "King Sized Burger",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(3),
          const TextWidget.light(
            "With: Extra Fries and chicken",
            size: kfsVeryTiny,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ]),
      ),
      horizontalSpace(5),
      const TextWidget.semibold("\u20A6 9,800", size: kfsRegular),
    ]);
  }
}
