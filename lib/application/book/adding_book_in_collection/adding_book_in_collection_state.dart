part of 'adding_book_in_collection_bloc.dart';

@freezed
class AddingBookInCollectionState with _$AddingBookInCollectionState {
  const factory AddingBookInCollectionState.initial() = _Initial;
  const factory AddingBookInCollectionState.loading() = _loading;
  const factory AddingBookInCollectionState.success() = _Success;
  const factory AddingBookInCollectionState.failure({
    required String message,
  }) = _Failure;
}
