part of 'book_bloc.dart';

@freezed
class BookState with _$BookState {
  const factory BookState.initial() = _Initial;
  const factory BookState.loading() = _Loading;
  const factory BookState.success({required List books}) = _Success;
  const factory BookState.failure({required String message}) = _Failure;
}
