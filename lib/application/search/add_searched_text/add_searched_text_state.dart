part of 'add_searched_text_bloc.dart';

@freezed
class AddSearchedTextState with _$AddSearchedTextState {
  const factory AddSearchedTextState.initial() = _Initial;
  const factory AddSearchedTextState.loading() = _Loading;
  const factory AddSearchedTextState.success() = _Success;
  const factory AddSearchedTextState.failure({
    required String message,
  }) = _Failure;
}
