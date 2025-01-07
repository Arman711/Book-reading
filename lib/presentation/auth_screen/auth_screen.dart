import 'package:auto_route/auto_route.dart';
import 'package:book_reading/application/auth_bloc/auth_bloc.dart';
import 'package:book_reading/application/book_bloc/book_bloc.dart';
import 'package:book_reading/application/non_fiction_cubit/non_fiction_book_cubit.dart';
import 'package:book_reading/presentation/auth_screen/auth_body.dart';
import 'package:book_reading/presentation/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        orElse: () => const AuthBody(),
      ),
      listener: (context, state) => state.whenOrNull(
        success: () {
          context.read<BookBloc>().add(
                const BookEvent.fetchBook(
                  'fiction',
                ),
              );
          context.read<NonFictionBookCubit>().fetchBooks(
                'non-fiction',
              );
          context.router.push(
            const GeneralRoute(),
          );
        },
      ),
    );
  }
}
