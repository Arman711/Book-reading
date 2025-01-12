import 'dart:convert';
import 'dart:developer';
import 'package:book_reading/domain/book/entity/book.dart';
import 'package:book_reading/domain/book/i_book_repository.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:http/http.dart' as http;

class BookRepositoryImpl implements IBookRepository {
  @override
  Future<Either<String, List<Book>>> fetchBook(String type) async {
    const String url = 'https://www.googleapis.com/books/v1/volumes';

    try {
      final response = await http.get(
        Uri.parse('$url?q=$type'),
      );
      log(response.statusCode.toString());
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
              description: volumeInfo['description'] ?? 'No Description',
            );
          },
        ).toList();
        return Right(books);
      } else {
        return const Left(
          'Failed to fetch books',
        );
      }
    } catch (e) {
      return const Left(
        'Failed to load books',
      );
    }
  }

  @override
  Future<Either<String, Book>> getBook(String id) async {
    const String url = 'https://www.googleapis.com/books/v1/volumes';

    try {
      final response = await http.get(
        Uri.parse('$url/$id'),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final volumeInfo = data['volumeInfo'] as Map<String, dynamic>;
        final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>?;

        final book = Book(
          id: data['id'] ?? '',
          title: volumeInfo['title'] ?? 'No Title',
          author: (volumeInfo['authors'] != null)
              ? (volumeInfo['authors'] as List).join(', ')
              : 'Unknown Author',
          imgUrl: imageLinks?['thumbnail'] ?? Assets.images.product.path,
          description: volumeInfo['description'] ?? 'No Description',
        );

        return Right(book);
      } else {
        return const Left(
          'Failed to fetch the book',
        );
      }
    } catch (e) {
      return Left(
        'Failed to load book: $e',
      );
    }
  }

  @override
  Future<Either<String, Unit>> addBookInCollection(Book book) async {
    final _firestore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser!.uid;
    try {
      await _firestore.collection('books_collection').doc(book.id).set(
            book.toJson(),
          );
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('book_collection')
          .doc()
          .set({
        'book_id': book.id,
      });
      return const Right(unit);
    } catch (e) {
      return const Left(
        'Failed adding book to collection',
      );
    }
  }

  @override
  Future<Either<String, List<Book>>> getBooksInCollection() async {
    final _firestore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser!.uid;
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('book_collection')
          .get();
      final userBookIds = snapshot.docs.map((doc) => doc['book_id'] as String);
      log(userBookIds.toString());
      final booksSnapshot = await _firestore
          .collection('books_collection')
          .where(
            'id',
            whereIn: userBookIds,
          )
          .get();
      List<Book> books = booksSnapshot.docs
          .map(
            (doc) => Book.fromJson(doc.data()),
          )
          .toList();
      log(books.toString());
      return Right(books);
    } catch (e) {
      return const Left('Failed to get books in collection');
    }
  }
}
