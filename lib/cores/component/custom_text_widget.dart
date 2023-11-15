import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/font_size.dart';
import '../helper/space_helper.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.size = kfsMedium,
    this.textColor = AppColor.textPrimary,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height,
    this.withOpacity,
  }) : super(key: key);

  const TextWidget.bold(
    this.text, {
    Key? key,
    this.size = kfsMedium,
    this.textColor = AppColor.textPrimary,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height = 1,
    this.withOpacity,
  })  : fontWeight = FontWeight.w700,
        super(key: key);

  const TextWidget.semibold(
    this.text, {
    Key? key,
    this.size = kfsMedium,
    this.textColor = AppColor.textPrimary,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height = 1,
    this.withOpacity,
  })  : fontWeight = FontWeight.w500,
        super(key: key);

  const TextWidget.light(
    this.text, {
    Key? key,
    this.size = kfsMedium,
    this.textColor = AppColor.textPrimary,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height = 1,
    this.withOpacity,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  final String text;
  final double size;
  final Color textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? height;
  final double? withOpacity;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: sp(size),
        color: textColor.withOpacity(withOpacity ?? 1.0),
        fontWeight: fontWeight,
        decoration: decoration,
        decorationColor: textColor.withOpacity(withOpacity ?? 1.0),
        height: height,
      ),
      textAlign: textAlign,
      overflow: overflow,
      softWrap: true,
      maxLines: maxLines,
      textScaleFactor: 0.85,
    );
  }
}
