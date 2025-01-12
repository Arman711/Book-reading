part of 'searched_text_bloc.dart';

@freezed
class SearchedTextState with _$SearchedTextState {
  const factory SearchedTextState.initial() = _Initial;
  const factory SearchedTextState.loading() = _Loading;
  const factory SearchedTextState.success({
    required List<String> searchedTexts,
  }) = _Success;
  const factory SearchedTextState.failure({
    required String message,
  }) = _Failure;
}
