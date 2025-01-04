import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthSwitcherText extends StatelessWidget {
  final String text;
  final String buttonText;
  final void Function() onTap;
  const AuthSwitcherText({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text,
        style: AppTypography.s14w4c83,
        children: <TextSpan>[
          TextSpan(
            text: buttonText,
            style: AppTypography.s14w5c853,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
