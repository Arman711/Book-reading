import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initializeDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'book_database.db');

  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        '''
      CREATE TABLE searched_text (
               id INTEGER PRIMARY KEY AUTOINCREMENT,
            text TEXT NOT NULL
          );

      ''',
      );
    },
  );
}
