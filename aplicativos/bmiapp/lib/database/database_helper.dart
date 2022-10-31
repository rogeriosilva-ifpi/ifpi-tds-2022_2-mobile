import 'package:path/path.dart' as path_pkg;
import 'package:sqflite/sqflite.dart';

import '../models/nota.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  Database? db;

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      path_pkg.join(path, 'notas.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          """
            CREATE TABLE notas (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nome TEXT NOT NULL,
              nota1 FLOAT NOT NULL,
              nota2 FLOAT NOT NULL
            )
        """,
        );
      },
    );
  }

  Future<int> addNota(Nota nota) async {
    final id = await db!.insert('notas', nota.toMap());
    return id;
  }

  Future<List<Nota>> getAllNotas() async {
    final list = await db!.query('notas');
    final notas = list.map((item) => Nota.fromMap(item)).toList();
    return notas;
  }
}
