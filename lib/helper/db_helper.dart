import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDB = await sql.openDatabase(path.join(dbPath, 'cornucopia.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE produit (id TEXT PRIMARY KEY ,  mark TEXT , subtitle TEXT,  descreption TEXT,  price DOUBLE,  image TEXT , isLicked INT )');
    }, version: 1);
    await sqlDB.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, Object>>> fetchData(String table) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDB = await sql.openDatabase(path.join(dbPath, 'cornucopia.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE produit (id TEXT PRIMARY KEY ,  mark TEXT , subtitle TEXT,  descreption TEXT,  price DOUBLE,  image TEXT , isLicked INT )');
    }, version: 1);
    return sqlDB.query(table);
  }

  static Future<void> updateItem(
      {String id,
      String title,
      String descrption,
      String mark,
      String image,
      double price,
      int isLicked}) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDB = await sql.openDatabase(path.join(dbPath, 'cornucopia.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE produit (id TEXT PRIMARY KEY ,  mark TEXT , subtitle TEXT,  descreption TEXT,  price DOUBLE,  image TEXT , isLicked INT )');
    }, version: 1);

    final data = {
      'subtitle': title,
      'descreption': descrption,
      'price': price,
      'image': image,
      'isLicked': isLicked,
      'mark': mark
    };

    await sqlDB.update('produit', data,
        where: "id = ?",
        whereArgs: [id],
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<void> deleteItem({String id}) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlDB = await sql.openDatabase(path.join(dbPath, 'cornucopia.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE produit (id TEXT PRIMARY KEY ,  mark TEXT , subtitle TEXT,  descreption TEXT,  price DOUBLE,  image TEXT , isLicked INT )');
    }, version: 1);

    await sqlDB.delete("produit", where: "id = ?", whereArgs: [id]);
  }
}
