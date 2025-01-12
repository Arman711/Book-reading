import 'dart:developer';

import 'package:book_reading/db.dart';
import 'package:book_reading/domain/search/i_search_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SearchRepositoryImpl implements ISearchRepository {
  @override
  Future<Either<String, Unit>> addSearchedText(
      {required String searchedText}) async {
    Database db = await initializeDatabase();
    try {
      await db.insert(
        'searched_text',
        {
          'text': searchedText,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      log('message');
      return const Right(unit);
    } catch (e) {
      return const Left(
        'Text is not incremented',
      );
    }
  }

  @override
  Future<Either<String, Unit>> deleteSearchedText(
      {required Database db, required String searchedTextId}) {
    // TODO: implement deleteSearchedText
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<String>>> getSearchedText() async {
    Database db = await initializeDatabase();
    try {
      List<Map<String, dynamic>> searchedTextData =
          await db.query('searched_text');
      List<String> searchedTexts = searchedTextData
          .map(
            (item) => item['text'] as String,
          )
          .toList();
      if (searchedTexts.isEmpty) {
        searchedTexts = ['aabbcc'];
      }
      return Right(searchedTexts);
    } catch (e) {
      return const Left(
        'db connect error',
      );
    }
  }
}
