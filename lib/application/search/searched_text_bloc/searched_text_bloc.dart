import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/search/i_search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searched_text_event.dart';
part 'searched_text_state.dart';
part 'searched_text_bloc.freezed.dart';

class SearchedTextBloc extends Bloc<SearchedTextEvent, SearchedTextState> {
  ISearchRepository repo;
  SearchedTextBloc(this.repo) : super(const _Initial()) {
    on<_GetSearchedText>(getSearchedText);
  }

  Future<void> getSearchedText(
      _GetSearchedText event, Emitter<SearchedTextState> emit) async {
    emit(
      const SearchedTextState.loading(),
    );
    final response = await repo.getSearchedText();
    response.fold(
      (message) {
        emit(
          SearchedTextState.failure(message: message),
        );
      },
      (searchedTexts) {
        emit(
          SearchedTextState.success(searchedTexts: searchedTexts),
        );
      },
    );
  }
}
