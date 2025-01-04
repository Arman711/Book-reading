import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTypography {
  static const boldTexts24w6 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const s14w4c83 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff838589),
  );
  static const s14w4c30 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.a30,
  );
  static const s14w5cw = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static const s14w5c853 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.a853,
  );
}
