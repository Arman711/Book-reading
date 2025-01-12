part of 'adding_book_in_collection_bloc.dart';

@freezed
class AddingBookInCollectionEvent with _$AddingBookInCollectionEvent {
  const factory AddingBookInCollectionEvent.addBookInCollection(
      {required Book book}) = _AddBookInCollection;
}
