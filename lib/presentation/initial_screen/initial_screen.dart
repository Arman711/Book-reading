import 'package:auto_route/auto_route.dart';
import 'package:book_reading/application/auth/cubit/check_user_cubit.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void checkUser() {
    context.read<CheckUserCubit>().checkIfUserSignedIn();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        const Duration(seconds: 2),
      );

      checkUser();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckUserCubit, CheckUserState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () => context.router.push(
            const GeneralRoute(),
          ),
          orElse: () => context.router.push(
            const AuthRoute(),
          ),
        );
      },
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.book,
                color: AppColor.a853,
              ),
              const Text(
                'Read Ease',
                style: TextStyle(
                  color: AppColor.a853,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
