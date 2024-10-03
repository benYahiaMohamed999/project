import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tomonylist/model/Tronsaction/TransactionModel.dart';
import 'package:tomonylist/model/database/nameTable.dart';

class DataSqlLiteHelper {
  static final DataSqlLiteHelper _instance = DataSqlLiteHelper._internal();
  static Database? _db;

  factory DataSqlLiteHelper() {
    return _instance;
  }

  DataSqlLiteHelper._internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await intDB();

    return _db;
  }

  intDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, databaseName);
    var myOwnDB = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
    return myOwnDB;
  }

  var sql = '''
    CREATE TABLE IF NOT EXISTS $tablePaid (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnAmount REAL,
      $columnDescription TEXT,
      $columnDateTime TEXT
    )
  ''';

  var sqlBorrowed = '''
  CREATE TABLE IF NOT EXISTS $tableBorrowed (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnAmount REAL,
    $columnDescription TEXT,
    $columnDateTime TEXT
  )
  ''';

  var sqlSpent = '''
    CREATE TABLE IF NOT EXISTS $tableSpent (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnAmount REAL,
      $columnDescription TEXT,
      $columnDateTime TEXT
    )
  ''';

  var sqlIncam = '''
    CREATE TABLE IF NOT EXISTS $tableIncam (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnAmount REAL,
      $columnDescription TEXT,
      $columnDateTime TEXT
    )
  ''';

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(sql);
    await db.execute(sqlBorrowed);
    await db.execute(sqlSpent);
    await db.execute(sqlIncam);
  }

  Future<int?> saveTaransaction({
    required PaidMonyModel transaction,
    required String nameTable,
  }) async {
    var dbClient = await db;
    int result = await dbClient!.insert(
      nameTable,
      transaction.toMap(),
    );
    return result;
  }

  Future<List<Map<String, dynamic>>> getALlTransaction(
      {required String nameTable}) async {
    var dbClient =
        await db; // Ensure `db` is a Future<Database> if using sqflite package
    var sql =
        'SELECT * FROM $nameTable'; // Ensure `$table` is correctly defined
    try {
      var result = await dbClient!.rawQuery(sql);
      return result;
    } catch (e) {
      log('Error fetching transactions: $e');
      return []; // Return an empty list or handle error as needed
    }
  }

  Future<int?> getCountTransaction({required String nameTable}) async {
    var dbClient = await db;
    var sql = 'SELECT COUNT(*) FROM $nameTable';
    return Sqflite.firstIntValue(await dbClient!.rawQuery(sql));
  }

  Future<PaidMonyModel?> getTransaction(
      {required int id,
      required String nameTable,
      required String columnIdName}) async {
    var dbClient = await db;
    var sql = 'SELECT * FROM $nameTable WHERE $columnIdName=$id';
    var result = await dbClient!.rawQuery(sql);
    // ignore: unrelated_type_equality_checks
    if (result == 0) return null;
    return PaidMonyModel.fromMap(result.first);
  }

  Future<int> deleteTransaction(
      {required int id,
      required String nameTable,
      required String columnIdName}) async {
    var dbClient = await db;

    return await dbClient!.delete(
      nameTable,
      where: "$columnIdName = ?",
      whereArgs: [id],
    );
  }

  Future<int?> updateTransaction(
      {required PaidMonyModel transaction,
      required String columnAmount_,
      required String columnDescription_,
      required String nameTable,
      required String columnDate_}) async {
    final dbClient = await db; // Assuming 'db' is your database instance

    try {
      final result = await dbClient!.rawUpdate(
        'UPDATE $nameTable SET $columnDate_ = ?, $columnAmount_ = ?, $columnDescription_ = ? WHERE id = ?',
        [
          transaction.dateTime, // Replace with actual fields from PaidMonyModel
          transaction.amount,
          transaction.description,
          transaction.id,
        ],
      );

      return result; // Return the number of rows affected
    } catch (e) {
      // Log the error for debugging purposes
      log('Error updating transaction: $e');
      return null; // Return null if an error occurs
    }
  }

  Future<void> close() async {
    var dbClient = await db;
    return await dbClient!.close();
  }

  Future<double> getTotalBorrowed({required String nameTable}) async {
    var dbClient = await db;
    var sql =
        'SELECT SUM($columnAmount) as total FROM $nameTable'; // Ensure `$table` and `$columnAmount` are correctly defined

    try {
      var result = await dbClient!.rawQuery(sql);
      if (result.isNotEmpty && result.first['total'] != null) {
        double total = double.parse(result.first['total'].toString());
        return total;
      } else {
        return 0.0;
      }
    } catch (e) {
      log('Error fetching transactions: $e');
      return 0.0;
    }
  }

  Future<double> getTotalPaid({required String nameTable}) async {
    var dbClient = await db;
    var sql =
        'SELECT SUM($columnAmount) as total FROM $nameTable'; // Ensure `$table` and `$columnAmount` are correctly defined

    try {
      var result = await dbClient!.rawQuery(sql);
      if (result.isNotEmpty && result.first['total'] != null) {
        double total = double.parse(result.first['total'].toString());
        return total;
      } else {
        return 0.0;
      }
    } catch (e) {
      log('Error fetching transactions: $e');
      return 0.0;
    }
  }
}
