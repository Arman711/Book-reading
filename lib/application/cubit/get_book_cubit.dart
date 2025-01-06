import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/book/entity/book.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_book_state.dart';
part 'get_book_cubit.freezed.dart';

class GetBookCubit extends Cubit<GetBookState> {
  IBookRepository repo;
  GetBookCubit(this.repo) : super(const GetBookState.initial());

  Future<void> getBook(String id) async {
    emit(const GetBookState.initial());
    final response = await repo.getBook(id);
    response.fold(
      (message) {
        emit(
          GetBookState.failure(
            message: message,
          ),
        );
      },
      (book) {
        emit(
          GetBookState.success(
            book: book,
          ),
        );
      },
    );
  }
}
