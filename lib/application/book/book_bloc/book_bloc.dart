import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_event.dart';
part 'book_state.dart';
part 'book_bloc.freezed.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final IBookRepository repo;
  BookBloc(this.repo) : super(const _Initial()) {
    on<_FetchBook>(onFetchBook);
    on<_GetBookCollection>(onGetCollectionBooks);
  }

  Future<void> onFetchBook(_FetchBook event, Emitter<BookState> emit) async {
    emit(const BookState.loading());
    final response = await repo.fetchBook(event.type);
    response.fold(
      (message) {
        emit(
          BookState.failure(message: message),
        );
      },
      (books) {
        emit(
          BookState.success(books: books),
        );
      },
    );
  }

  Future<void> onGetCollectionBooks(
      _GetBookCollection event, Emitter<BookState> emit) async {
    emit(const BookState.loading());
    final response = await repo.getBooksInCollection();
    response.fold(
      (message) {
        emit(
          BookState.failure(message: message),
        );
      },
      (books) {
        emit(
          BookState.success(books: books),
        );
      },
    );
  }
}
