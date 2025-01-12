import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final bool isFailure;
  final TextEditingController controller;
  final bool isObscureText;
  final String? text;
  final Widget? suffixIcon;
  final Color? textColor;
  final Color? iconColor;
  const AppTextField({
    super.key,
    required this.controller,
    this.text,
    this.suffixIcon,
    this.textColor,
    this.iconColor,
    this.isFailure = false,
    this.isObscureText = false,
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
            border: isFailure
                ? Border.all(
                    color: Colors.red,
                  )
                : null,
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(color: textColor),
            obscureText: isObscureText,
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
