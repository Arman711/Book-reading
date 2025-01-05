import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_event.dart';
part 'book_state.dart';
part 'book_bloc.freezed.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final IBookRepository repo;
  BookBloc(this.repo) : super(const _Initial()) {
    on<BookEvent>(
      (event, emit) async {
        await event.when(
          fetchBook: (type) async {
            emit(const BookState.loading());
            final response = await repo.fetchBook(type);
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
          },
        );
      },
    );
  }
}
