import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Sized Box
SizedBox verticalSpace([double value = 10]) => SizedBox(height: value.sp);
SizedBox horizontalSpace([double value = 10]) => SizedBox(width: value.sp);

/// Calculates the sp (Scalable Pixel) depending on the device's screen size
double sp(double value) => value.sp;
double h(double value) => value.h;
double w(double value) => value.w;
double sr(double value) => value.r;

/// return a percentage of the screen height or width in respect to the  value given
double sh(double value) => (value / 100).sh;
double sw(double value) => (value / 100).sw;
