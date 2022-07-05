import 'package:make_own_workout/model/mow_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper? _instance;
  static Database? _database;

  DBHelper._internal() {
    _instance = this;
  }

  factory DBHelper() => _instance ?? DBHelper._internal();

  static const String _tblApp = 'mow';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/mow_app.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblApp (
             _id TEXT PRIMARY KEY,
             name TEXT,
             image TEXT,
             description TEXT
           )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<void> insertMOW(Data mow) async {
    final db = await database;
    await db!.insert(_tblApp, mow.toJson());
  }

  Future<List<Data>> getAlls() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblApp);

    return results.map((mow) => Data.fromJson(mow)).toList();
  }

  Future<Map> getMOWById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblApp,
      where: '_id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeMOW(String id) async {
    final db = await database;

    await db!.delete(
      _tblApp,
      where: '_id = ?',
      whereArgs: [id],
    );
  }
}
