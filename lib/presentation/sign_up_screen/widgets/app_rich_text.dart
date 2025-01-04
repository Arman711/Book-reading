import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an acount?',
          style: AppTypography.s14w4c83,
        ),
        Text(
          'Login',
          style: AppTypography.s14w5c853,
        ),
      ],
    );
  }
}
