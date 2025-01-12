import 'package:book_reading/application/book/adding_book_in_collection/adding_book_in_collection_bloc.dart';
import 'package:book_reading/application/search/add_searched_text/add_searched_text_bloc.dart';
import 'package:book_reading/application/auth_bloc/auth_bloc.dart';
import 'package:book_reading/application/book/book_bloc/book_bloc.dart';
import 'package:book_reading/application/book/cubit/get_book_cubit.dart';
import 'package:book_reading/application/search/searched_text_bloc/searched_text_bloc.dart';
import 'package:book_reading/application/user_bloc/user_bloc.dart';
import 'package:book_reading/domain/auth/i_auth_repository.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:book_reading/domain/search/i_search_repository.dart';
import 'package:book_reading/domain/user/i_user_repository.dart';
import 'package:book_reading/infrastructure/auth/auth_repository.dart';
import 'package:book_reading/infrastructure/book/book_repository_impl.dart';
import 'package:book_reading/infrastructure/search/search_repository_impl.dart';
import 'package:book_reading/infrastructure/user/user_repository_impl.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;
Future<void> initializeDependencies() async {
  di.registerSingleton<IUserRepository>(
    UserRepositoryImpl(),
  );
  di.registerLazySingleton<UserBloc>(
    () => UserBloc(
      di(),
    ),
  );
  di.registerSingleton<ISearchRepository>(
    SearchRepositoryImpl(),
  );
  di.registerFactory<SearchedTextBloc>(
    () => SearchedTextBloc(
      di(),
    ),
  );
  di.registerLazySingleton<AddSearchedTextBloc>(
    () => AddSearchedTextBloc(
      di(),
    ),
  );
  di.registerLazySingleton<AddingBookInCollectionBloc>(
    () => AddingBookInCollectionBloc(
      di(),
    ),
  );
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
}
