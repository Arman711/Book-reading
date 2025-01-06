import 'package:book_reading/application/book_bloc/book_bloc.dart';
import 'package:book_reading/application/cubit/get_book_cubit.dart';
import 'package:book_reading/application/non_fiction_cubit/non_fiction_book_cubit.dart';
import 'package:book_reading/firebase_options.dart';
import 'package:book_reading/infrastructure/book/book_repository_impl.dart';
import 'package:book_reading/presentation/core/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

final AppRouter appRouter = AppRouter();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(
          create: (context) => GetBookCubit(BookRepositoryImpl()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
