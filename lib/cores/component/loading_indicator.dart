import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({
    Key? key,
    this.strokeWidth,
    this.value,
    this.size,
  }) : super(key: key);

  final double? strokeWidth;
  final double? value;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    if (size != null) {
      return SizedBox(
        width: size!.width,
        height: size!.height,
        child: CupertinoActivityIndicator(
          color: Colors.grey,
          radius: size!.width / 2,
        ),
      );
    }

    return const CupertinoActivityIndicator(color: Colors.grey);
  }
}
