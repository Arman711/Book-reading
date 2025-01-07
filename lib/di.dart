import 'package:book_reading/application/auth_bloc/auth_bloc.dart';
import 'package:book_reading/application/book_bloc/book_bloc.dart';
import 'package:book_reading/application/cubit/get_book_cubit.dart';
import 'package:book_reading/application/non_fiction_cubit/non_fiction_book_cubit.dart';
import 'package:book_reading/domain/auth/i_auth_repository.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:book_reading/infrastructure/auth/auth_repository.dart';
import 'package:book_reading/infrastructure/book/book_repository_impl.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;
Future<void> initializeDependencies() async {
  di.registerSingleton<IAuthRepository>(
    AuthRepository(),
  );
  di.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      di(),
    ),
  );
  di.registerSingleton<IBookRepository>(
    BookRepositoryImpl(),
  );
  di.registerLazySingleton<BookBloc>(
    () => BookBloc(
      di(),
    ),
  );
  di.registerLazySingleton<GetBookCubit>(
    () => GetBookCubit(
      di(),
    ),
  );
  di.registerLazySingleton<NonFictionBookCubit>(
    () => NonFictionBookCubit(
      di(),
    ),
  );
}
