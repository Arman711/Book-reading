import 'package:book_reading/application/auth_bloc/auth_bloc.dart';
import 'package:book_reading/application/book/adding_book_in_collection/adding_book_in_collection_bloc.dart';
import 'package:book_reading/application/book/cubit/get_book_cubit.dart';
import 'package:book_reading/application/search/add_searched_text/add_searched_text_bloc.dart';
import 'package:book_reading/application/user_bloc/user_bloc.dart';
import 'package:book_reading/di.dart';
import 'package:book_reading/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetBookCubit(di()),
        ),
        BlocProvider(
          create: (context) => di<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => di<UserBloc>(),
        ),
        BlocProvider(
          create: (context) => di<AddSearchedTextBloc>(),
        ),
        BlocProvider(
          create: (context) => di<AddingBookInCollectionBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
