import 'package:flutter/material.dart';

import '../../../../cores/component/custom_text_widget.dart';
import '../../../../cores/component/image_widget.dart';
import '../../../../cores/helper/space_helper.dart';
import '../../../auth/domain/entities/auth_entity.dart';

class OrderViewHeaderWidget extends StatelessWidget {
  const OrderViewHeaderWidget(this.userData, {super.key});

  final UserDetails userData;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.bold(userData.fullName),
            TextWidget.light(userData.email),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: ImageWidget(
            height: h(40),
            width: w(40),
            imageUrl: userData.profilePicUrl,
            imageTypes: ImageTypes.network,
          ),
        ),
      ]),
      verticalSpace(20),
    ]);
  }
}
