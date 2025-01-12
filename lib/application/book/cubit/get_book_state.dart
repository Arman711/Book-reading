part of 'get_book_cubit.dart';

@freezed
class GetBookState with _$GetBookState {
  const factory GetBookState.initial() = _Initial;
  const factory GetBookState.loading() = _Loading;
  const factory GetBookState.success({required Book book}) = _Success;
  const factory GetBookState.failure({required String message}) = _Failure;
}
