import 'package:auto_route/auto_route.dart';
import 'package:book_reading/application/auth/auth_bloc/auth_bloc.dart';
import 'package:book_reading/application/user_bloc/user_bloc.dart';
import 'package:book_reading/presentation/auth_screen/widgets/auth_body.dart';
import 'package:book_reading/presentation/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => AuthBody(
          emailController: emailController,
          isSuccess: true,
        ),
        failure: (message) => AuthBody(
          errorMsg: message,
          emailController: emailController,
          isFailure: true,
        ),
        orElse: () => AuthBody(
          emailController: emailController,
        ),
      ),
      listener: (context, state) => state.whenOrNull(
        // ignore: body_might_complete_normally_nullable
        success: () {
          context.read<UserBloc>().add(
                const UserEvent.createUser(),
              );

          context.router.push(
            const GeneralRoute(),
          );
        },
      ),
    );
  }
}
