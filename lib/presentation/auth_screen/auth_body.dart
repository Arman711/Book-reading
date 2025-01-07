import 'package:book_reading/application/auth_bloc/auth_bloc.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:book_reading/presentation/core/widgets/primary_button.dart';
import 'package:book_reading/presentation/auth_screen/widgets/app_divider.dart';
import 'package:book_reading/presentation/auth_screen/widgets/auth_switcher_text.dart';
import 'package:book_reading/presentation/auth_screen/widgets/app_text_field.dart';
import 'package:book_reading/presentation/auth_screen/widgets/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthScreenState();
}

bool isCreatedAccount = true;

class _AuthScreenState extends State<AuthBody> {
  void signUpOrSignIn() {
    setState(
      () {
        isCreatedAccount = !isCreatedAccount;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
                isCreatedAccount ? 'Create your account' : 'Log in',
                style: AppTypography.boldTexts24w6,
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 50,
                child: Text(
                  isCreatedAccount
                      ? 'Create an account and explore a tailored library of captivating stories.'
                      : 'Welcome back! Log in to resume your reading journey.',
                  style: AppTypography.s14w4c83,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              AppTextField(
                controller: emailController,
                text: 'Email address',
              ),
              AppTextField(
                controller: passwordController,
                text: 'Password',
                isObscureText: true,
                suffixIcon: SvgPicture.asset(
                  Assets.icons.eye,
                  height: 16,
                  width: 20,
                  fit: BoxFit.none,
                ),
                iconColor: AppColor.f83,
              ),
              const SizedBox(
                height: 14,
              ),
              PrimaryButton(
                text: isCreatedAccount ? 'Create new account' : 'Log in',
                onTap: () async {
                  if (isCreatedAccount) {
                    context.read<AuthBloc>().add(
                          AuthEvent.signUpWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                  } else {
                    context.read<AuthBloc>().add(
                          AuthEvent.logIn(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                  }
                },
              ),
              const SizedBox(
                height: 14,
              ),
              Center(
                child: AuthSwitcherText(
                  text: isCreatedAccount
                      ? 'Already have an account?'
                      : 'Don’t have an account?',
                  buttonText: isCreatedAccount ? ' Login' : ' Sign up',
                  onTap: signUpOrSignIn,
                ),
              ),
              const Spacer(),
              const AppDivider(),
              const SizedBox(
                height: 14,
              ),
              GoogleButton(
                onTap: () {
                  context
                      .read<AuthBloc>()
                      .add(const AuthEvent.signInWithGoogle());
                },
                text: isCreatedAccount
                    ? 'Sign up with Google'
                    : 'Login with Google',
              ),
              const Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
