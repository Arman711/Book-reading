import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  const GoogleButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: AppColor.a853,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                Assets.images.google.path,
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: AppTypography.s14w5c853,
            ),
          ],
        ),
      ),
    );
  }
}
