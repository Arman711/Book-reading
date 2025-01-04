import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:book_reading/presentation/core/widgets/primary_button.dart';
import 'package:book_reading/presentation/sign_up_screen/widgets/app_divider.dart';
import 'package:book_reading/presentation/sign_up_screen/widgets/auth_switcher_text.dart';
import 'package:book_reading/presentation/sign_up_screen/widgets/app_text_field.dart';
import 'package:book_reading/presentation/sign_up_screen/widgets/google_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool a = true;

class _SignUpScreenState extends State<SignUpScreen> {
  void signUpOrSignIn() {
    setState(
      () {
        if (a == true) {
          a = false;
        } else {
          a = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 4,
            ),
            Text(
              a ? 'Create your account' : 'Log in',
              style: AppTypography.boldTexts24w6,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              a
                  ? 'Create an account and explore a tailored library of captivating stories.'
                  : 'Welcome back! Log in to resume your reading journey.',
              style: AppTypography.s14w4c83,
            ),
            const Spacer(
              flex: 2,
            ),
            const AppTextField(
              text: 'Email address',
            ),
            const AppTextField(
              text: 'Password',
              suffixIcon: Icons.remove_red_eye_outlined,
            ),
            const SizedBox(
              height: 14,
            ),
            PrimaryButton(text: a ? 'Create new account' : 'Log in'),
            const SizedBox(
              height: 14,
            ),
            Center(
              child: AuthSwitcherText(
                text: a ? 'Already have an acount?' : 'Don’t have an acount?',
                buttonText: a ? ' Login' : ' Sign up',
                onTap: signUpOrSignIn,
              ),
            ),
            const Spacer(),
            const AppDivider(),
            const SizedBox(
              height: 14,
            ),
            GoogleButton(
              text: a ? 'Sign up with Google' : 'Login with Google',
            ),
            const Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
