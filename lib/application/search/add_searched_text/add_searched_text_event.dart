part of 'add_searched_text_bloc.dart';

@freezed
class AddSearchedTextEvent with _$AddSearchedTextEvent {
  const factory AddSearchedTextEvent.addSearchedText({
    required String text,
  }) = _AddSearchedText;
}
