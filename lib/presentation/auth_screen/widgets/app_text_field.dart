import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  final String? text;
  final SvgPicture? suffixIcon;
  final Color? textColor;
  final Color? iconColor;
  const AppTextField({
    super.key,
    this.text,
    this.suffixIcon,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: text != null
              ? Text(
                  text!,
                  style: AppTypography.s14w4c30,
                )
              : null,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.fa,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
