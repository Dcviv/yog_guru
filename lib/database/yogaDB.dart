import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:yog_guru/model/model.dart';

class YogaDatabase {
  static final YogaDatabase instance = YogaDatabase._init();
  static Database? _database;
  YogaDatabase._init();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initializeDB('YogaStepsDB.db');
      return _database;
    }
  }

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const intType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    //id,bool(seconds),text

    await db.execute('''
     CREATE TABLE ${YogaModel.YogaTable1}(
       ${YogaModel.IDName} $idType,
       ${YogaModel.YogaName} $textType,
       ${YogaModel.ImageName} $textType,
       ${YogaModel.SecondsOrNot} $boolType,
       ${YogaModel.SecondsOrTimes} $textType,
       ${YogaModel.IconName} $textType)''');
    await db.execute('''
     CREATE TABLE ${YogaModel.YogaTable2}(
       ${YogaModel.IDName} $idType,
       ${YogaModel.YogaName} $textType,
       ${YogaModel.ImageName} $textType,
       ${YogaModel.SecondsOrNot} $boolType,
       ${YogaModel.SecondsOrTimes} $textType,
       ${YogaModel.IconName} $textType)''');
    await db.execute('''
     CREATE TABLE ${YogaModel.YogaTable3}(
       ${YogaModel.IDName} $idType,
       ${YogaModel.YogaName} $textType,
       ${YogaModel.ImageName} $textType,
       ${YogaModel.SecondsOrNot} $boolType,
       ${YogaModel.SecondsOrTimes} $textType,
       ${YogaModel.IconName} $textType)''');
    await db.execute('''
     CREATE TABLE ${YogaModel.YogaTableBed}(
       ${YogaModel.IDName} $idType,
       ${YogaModel.YogaName} $textType,
       ${YogaModel.ImageName} $textType,
       ${YogaModel.SecondsOrNot} $boolType,
       ${YogaModel.SecondsOrTimes} $textType,
       ${YogaModel.IconName} $textType)''');
    await db.execute('''
     CREATE TABLE ${YogaModel.YogaTableFat}(
       ${YogaModel.IDName} $idType,
       ${YogaModel.YogaName} $textType,
       ${YogaModel.ImageName} $textType,
       ${YogaModel.SecondsOrNot} $boolType,
       ${YogaModel.SecondsOrTimes} $textType,
       ${YogaModel.IconName} $textType)''');
    await db.execute('''
     CREATE TABLE ${YogaModel.YogaTable4}(
       ${YogaModel.IDName} $idType,
       ${YogaModel.YogaWorkoutName} $textType,
       ${YogaModel.BackGroundImage} $textType,
       ${YogaModel.TimeTaken} $textType,
       ${YogaModel.TotalNoOfWorkouts} $textType,
       ${YogaModel.YogaKey} $intType)''');
  }

  Future<Yoga?> insert(Yoga yoga, String TableName) async {
    final db = await instance.database;
    final id = await db!.insert(TableName, yoga.toJSON());
    return yoga.copy(id: id);
  }

  Future<YogaSummary?> insertYogaSummary(YogaSummary yogaSummary) async {
    final db = await instance.database;
    final id = await db!.insert(YogaModel.YogaTable4, yogaSummary.toJSON());
    return yogaSummary.copy(id: id);
  }

  Future<List<Yoga>> readAllYoga(String TableName) async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IDName} ASC';
    final queryres = await db!.query(TableName, orderBy: orderBy);
    return queryres.map((json) => Yoga.fromJSON(json)).toList();
  }

  Future<List<YogaSummary>> readAllYogaSummary() async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IDName} ASC';
    final queryRes = await db!.query(YogaModel.YogaTable4, orderBy: orderBy);
    return queryRes.map((json) => YogaSummary.fromJSON(json)).toList();
  }

  Future<Yoga?> readOneYoga(int id, String TableName) async {
    final db = await instance.database;
    final map = await db!.query(TableName,
        columns: YogaModel.YogaTable1ColumnName,
        where: '${YogaModel.IDName}=?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Yoga.fromJSON(map.first);
    } else {
      return null;
    }
  }
}
