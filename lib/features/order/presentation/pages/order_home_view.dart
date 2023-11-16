import 'package:flutter/material.dart';

import '../../../../cores/component/custom_scaffold_widget.dart';
import '../../../../cores/helper/space_helper.dart';
import '../../../auth/domain/entities/auth_entity.dart';
import '../widgets/order_summary_widget.dart';
import '../widgets/order_view_header_widget.dart';

class OrderHomeView extends StatelessWidget {
  static const String routeName = "order-home-view";

  final UserDetails userData;
  const OrderHomeView(this.userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(children: [
        verticalSpace(),
        OrderViewHeaderWidget(userData),
        SizedBox(height: h(100), child: const Placeholder()),
        const OrderSummaryWidget(),
      ]),
    );
  }
}
