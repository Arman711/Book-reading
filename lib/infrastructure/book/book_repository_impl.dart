import 'dart:convert';

import 'package:book_reading/domain/book/entity/book.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:http/http.dart' as http;

class BookRepositoryImpl implements IBookRepository {
  @override
  Future<Either<String, List<Book>>> fetchBook(String type) async {
    const String url = 'https://www.googleapis.com/books/v1/volumes';

    try {
      final response = await http.get(
        Uri.parse('$url?q=$type'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final books = (data['items'] as List).map(
          (item) {
            final volumeInfo = item['volumeInfo'] as Map<String, dynamic>;
            final imageLinks =
                volumeInfo['imageLinks'] as Map<String, dynamic>?;
            return Book(
              id: item['id'] ?? '',
              title: volumeInfo['title'] ?? 'No Title',
              author: (volumeInfo['authors'] != null)
                  ? (volumeInfo['authors'] as List).join(', ')
                  : 'Unknown Author',
              imgUrl: imageLinks?['thumbnail'] ?? '',
            );
          },
        ).toList();
        return Right(books);
      } else {
        return const Left('Failed to fetch books');
      }
    } catch (e) {
      return const Left('Failed to load books');
    }
  }
}
