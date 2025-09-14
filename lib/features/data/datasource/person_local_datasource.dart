import 'package:crisent_pannel/features/data/model/person_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PersonLocalDatasource {
  static Database? _database;

  //! Lazy DB getter
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  //! Initialize SQLite
  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'person.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE person(
            uid TEXT PRIMARY KEY,
            userName TEXT,
            email TEXT,
            image TEXT,
            fcmToken TEXT
          )
        ''');
      },
    );
  }

  //! Insert or replace
  Future<void> insertPerson(PersonModel person) async {
    final db = await database;
    await db.insert(
      'person',
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //! Get 
  Future<PersonModel?> getPerson() async {
    final db = await database;
    final maps = await db.query('person', limit: 1);
    if (maps.isNotEmpty) {
      return PersonModel.fromMap(maps.first);
    }
    return null;
  }

  //! Delete the user (logout)
  Future<void> deletePerson() async {
    final db = await database;
    await db.delete('person'); 
  }
}
