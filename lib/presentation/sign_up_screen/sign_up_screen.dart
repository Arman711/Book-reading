import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:book_reading/presentation/core/widgets/primary_button.dart';
import 'package:book_reading/presentation/sign_up_screen/widgets/app_divider.dart';
import 'package:book_reading/presentation/sign_up_screen/widgets/app_rich_text.dart';
import 'package:book_reading/presentation/sign_up_screen/widgets/app_text_field.dart';
import 'package:book_reading/presentation/sign_up_screen/widgets/google_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(
              flex: 4,
            ),
            Text(
              'Create your account',
              style: AppTypography.boldTexts24w6,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Create an account and explore a tailored library of captivating stories.',
              style: AppTypography.s14w4c83,
            ),
            Spacer(
              flex: 2,
            ),
            AppTextField(
              text: 'Email address',
            ),
            AppTextField(
              text: 'Password',
              suffixIcon: Icons.remove_red_eye_outlined,
            ),
            SizedBox(
              height: 14,
            ),
            PrimaryButton(text: 'Create new account'),
            SizedBox(
              height: 14,
            ),
            AppRichText(),
            Spacer(),
            AppDivider(),
            SizedBox(
              height: 14,
            ),
            GoogleButton(),
            Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
