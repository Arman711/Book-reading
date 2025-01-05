import 'package:book_reading/application/book_bloc/book_bloc.dart';
import 'package:book_reading/application/cubit/non_fiction_book_cubit.dart';
import 'package:book_reading/infrastructure/book/book_repository_impl.dart';
import 'package:book_reading/presentation/core/router/router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

final AppRouter appRouter = AppRouter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookBloc(BookRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => NonFictionBookCubit(BookRepositoryImpl()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }
}
