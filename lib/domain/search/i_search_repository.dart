import 'package:fpdart/fpdart.dart';
import 'package:sqflite/sqflite.dart';

abstract interface class ISearchRepository {
  Future<Either<String, List<String>>> getSearchedText();
  Future<Either<String, Unit>> addSearchedText({
    required String searchedText,
  });
  Future<Either<String, Unit>> deleteSearchedText({
    required Database db,
    required String searchedTextId,
  });
}
