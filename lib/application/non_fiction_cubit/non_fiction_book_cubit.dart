import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/book/entity/book.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'non_fiction_book_state.dart';
part 'non_fiction_book_cubit.freezed.dart';

class NonFictionBookCubit extends Cubit<NonFictionBookState> {
  IBookRepository repo;
  NonFictionBookCubit(this.repo) : super(const NonFictionBookState.initial());

  Future<void> fetchBooks(String type) async {
    emit(
      const NonFictionBookState.initial(),
    );
    final response = await repo.fetchBook(type);
    response.fold(
      (message) {
        emit(
          NonFictionBookState.failure(
            message: message,
          ),
        );
      },
      (books) {
        emit(
          NonFictionBookState.success(
            books: books,
          ),
        );
      },
    );
  }
}
