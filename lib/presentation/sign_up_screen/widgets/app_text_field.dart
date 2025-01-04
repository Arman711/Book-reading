import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String text;
  final IconData? suffixIcon;
  const AppTextField({
    super.key,
    required this.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: Text(
            text,
            style: AppTypography.s14w4c30,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.fa,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(
                suffixIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
