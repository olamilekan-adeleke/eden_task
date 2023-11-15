import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eden_task/cores/constants/colors.dart';
import 'package:flutter/material.dart';

import 'loading_indicator.dart';

enum ImageTypes { network, file, asset, none }

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageTypes,
    this.imageUrl,
    this.useIconColor = false,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  final String? imageUrl;
  final ImageTypes imageTypes;
  final bool useIconColor;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = AppColor.greyBackground;

    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        height: height,
        width: width,
        color: backGroundColor,
        child: const Center(child: Icon(Icons.broken_image_rounded)),
      );
    }

    // log(imageUrl);

    switch (imageTypes) {
      case ImageTypes.network:
        return Container(
          height: height,
          width: width,
          color: color ?? Colors.black,
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: fit,
            errorWidget: (_, __, ___) => _buildErrorWidget(backGroundColor),
            placeholder: (_, __) => const Center(
              child: LoadingIndicatorWidget(),
            ),
          ),
        );

      case ImageTypes.file:
        return SizedBox(
          height: height,
          width: width,
          child: Image.file(
            File(imageUrl!),
            fit: fit,
            errorBuilder: (_, __, ___) => _buildErrorWidget(backGroundColor),
          ),
        );

      case ImageTypes.asset:
        return SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            imageUrl!,
            fit: fit,
            errorBuilder: (_, __, ___) => _buildErrorWidget(backGroundColor),
          ),
        );

      case ImageTypes.none:
        return SizedBox(
            height: height, width: width, child: const Placeholder());
    }
  }

  Widget _buildErrorWidget(Color backGroundColor) {
    return Container(
      color: backGroundColor,
      child: const Center(child: Icon(Icons.error)),
    );
  }
}
