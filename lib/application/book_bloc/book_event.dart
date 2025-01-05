part of 'book_bloc.dart';

@freezed
class BookEvent with _$BookEvent {
  const factory BookEvent.fetchBook(String type) = _FetchBook;
}
