import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/search/i_search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_searched_text_event.dart';
part 'add_searched_text_state.dart';
part 'add_searched_text_bloc.freezed.dart';

class AddSearchedTextBloc
    extends Bloc<AddSearchedTextEvent, AddSearchedTextState> {
  final ISearchRepository repo;
  AddSearchedTextBloc(this.repo) : super(const _Initial()) {
    on<_AddSearchedText>(addSearchedText);
  }
  Future<void> addSearchedText(
      _AddSearchedText event, Emitter<AddSearchedTextState> emit) async {
    emit(
      const AddSearchedTextState.loading(),
    );
    final response = await repo.addSearchedText(searchedText: event.text);
    response.fold(
      (message) {
        emit(
          AddSearchedTextState.failure(message: message),
        );
      },
      (_) {
        emit(const AddSearchedTextState.success());
      },
    );
  }
}
