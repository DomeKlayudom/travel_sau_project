import 'package:sqflite/sqflite.dart';
import 'package:travel_sau_project/models/travel.dart';
import 'package:travel_sau_project/models/user.dart';

class DBHelper {
  static Future<Database> db() async {
    return openDatabase(
      'travelrecord.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createUserTable(database);
        await createTravelTable(database);
      },
    );
  }

  static Future<void> createUserTable(Database database) async {
    await database.execute('''
    CREATE TABLE usertb (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      fullname TEXT,
      email TEXT,
      phone TEXT,
      username TEXT,
      password TEXT,
      picture TEXT
    )
  ''');
  }

  static Future<void> createTravelTable(Database database) async {
    await database.execute('''
      create table traveltb(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        pictureTravel text,
        placeTravel text,
        costTravel text,
        dateTravel text,
        dayTravel text,
        locationTravel text
      )
      ''');
  }

  static Future<int> insertUser(User user) async {
    final db = await DBHelper.db();

    final id = await db.insert(
      'usertb',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }

  static Future<int> insertTravel(Travel travel) async {
    final db = await DBHelper.db();

    final id = await db.insert(
      'traveltb',
      travel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }

  static Future<User?> checkSignin(String username, String password) async {
    final db = await DBHelper.db();

    List<Map<String, dynamic>> result = await db.query(
      'usertb',
      where: 'username = ? and password = ?',
      whereArgs: [username, password],
    );

    if (result.length > 0) {
      return User.fromMap(result[0]);
    } else {
      return null;
    }
  }

  static Future<List<Travel>> getAllTravel() async {
    final db = await DBHelper.db();

    final result = await db.query(
      'traveltb',
      orderBy: 'id DESC',
    );

    return result.map((data) => Travel.fromMap(data)).toList();
  }
}
