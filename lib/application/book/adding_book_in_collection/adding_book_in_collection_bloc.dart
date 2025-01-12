import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/book/entity/book.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'adding_book_in_collection_event.dart';
part 'adding_book_in_collection_state.dart';
part 'adding_book_in_collection_bloc.freezed.dart';

class AddingBookInCollectionBloc
    extends Bloc<AddingBookInCollectionEvent, AddingBookInCollectionState> {
  IBookRepository repo;
  AddingBookInCollectionBloc(this.repo) : super(_Initial()) {
    on<AddingBookInCollectionEvent>(addBookInCollection);
  }

  Future<void> addBookInCollection(AddingBookInCollectionEvent event,
      Emitter<AddingBookInCollectionState> emit) async {
    emit(
      const AddingBookInCollectionState.loading(),
    );
    final response = await repo.addBookInCollection(
      event.book,
    );
    response.fold(
      (message) {
        emit(
          AddingBookInCollectionState.failure(message: message),
        );
      },
      (_) {
        emit(
          const AddingBookInCollectionState.success(),
        );
      },
    );
  }
}
