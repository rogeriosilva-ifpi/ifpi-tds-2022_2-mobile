import 'dart:io';

import 'package:path/path.dart' as path_pkg;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../models/nota.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  Database? db;

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<void> initDB() async {
    sqfliteFfiInit();

    const sqlCreateDb = """
            CREATE TABLE notas (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nome TEXT NOT NULL,
              nota1 FLOAT NOT NULL,
              nota2 FLOAT NOT NULL
            )
        """;

    String path = await getDatabasesPath();
    final dbFile = path_pkg.join(path, 'notas.db');

    if (Platform.isLinux) {
      db = await databaseFactoryFfi.openDatabase(
        dbFile,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute(sqlCreateDb);
          },
        ),
      );
    } else {
      db = await openDatabase(
        dbFile,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(sqlCreateDb);
        },
      );
    }
  }

  Future<int> addNota(Nota nota) async {
    final id = await db!.insert('notas', nota.toMap());
    return id;
  }

  Future<int> updateNota(Nota nota) async {
    int count = await db!.update(
      'notas',
      nota.toMap(),
      where: 'id = ?',
      whereArgs: [nota.id],
    );

    return count;
  }

  Future<List<Nota>> getAllNotas() async {
    // final list = await db!.execute("SELECT * from Notas");
    final list = await db!.query('notas');
    final notas = list.map((item) => Nota.fromMap(item)).toList();
    return notas;
  }

  Future<void> deleteNota(Nota nota) async {
    await db!.delete(
      'notas',
      where: 'id = ?',
      whereArgs: [nota.id],
    );
  }
}
