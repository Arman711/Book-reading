import 'package:book_reading/domain/book/entity/book.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IBookRepository {
  Future<Either<String, List<Book>>> fetchBook(String type);
  Future<Either<String, Book>> getBook(String id);
}
