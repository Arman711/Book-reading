part of 'non_fiction_book_cubit.dart';

@freezed
class NonFictionBookState with _$NonFictionBookState {
  const factory NonFictionBookState.initial() = _Initial;
  const factory NonFictionBookState.loading() = _Loading;
  const factory NonFictionBookState.success({required List<Book> books}) =
      _Success;
  const factory NonFictionBookState.failure({required String message}) =
      _Failure;
}
