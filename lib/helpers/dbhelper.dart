import 'dart:io';
import 'package:furniture_app/models/sparepart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
 static DbHelper _dbHelper;
 static Database _database;

 DbHelper._CreateObject();

 factory DbHelper() {
 if(_dbHelper == null) {
 _dbHelper = DbHelper._CreateObject();
 }
 return _dbHelper;
 }

 Future<Database> initDb() async {
 Directory directory = await getApplicationDocumentsDirectory();
 String path = directory.path + 'sparepart.db';
 var sparepartDatabase = openDatabase(path, version: 1, onCreate: 
_createDb);
 return sparepartDatabase;
 }

 void _createDb(Database db, int version) async {
 await db.execute('''
 CREATE TABLE sparepart (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 deskripsi TEXT,
 harga TEXT
 )
 ''');
 }

 Future<Database> get database async {
 if (_database == null) {
 _database = await initDb();
 }
 return _database;
 }

 Future<int> insert(Sparepart object) async {
 Database db = await this.database;
 int count = await db.insert('sparepart', object.toMap());
 return count;
 }

 Future<List<Map<String, dynamic>>> select() async {
 Database db = await this.database;
 var mapList = await db.query('sparepart', orderBy: 'deskripsi');
 return mapList;
 }

 Future<int> update(Sparepart object) async {
 Database db = await this.database;
 int count = await db.update('sparepart', object.toMap(), where: 'id=?', 
whereArgs: [object.id]);
 return count;
 }

 Future<int> delete(int id) async {
 Database db = await this.database;
 int count = await db.delete('sparepart', where: 'id=?', whereArgs: [id]);
 return count;
 }

 Future<List<Sparepart>> getSparepartList() async {
 var sparepartMapList = await select();
 int count = sparepartMapList.length;
 List<Sparepart> sparepartList = List<Sparepart>();
 for (int i=0; i<count; i++){
 sparepartList.add(Sparepart.forMap(sparepartMapList[i]));
 }
 
 return sparepartList;
 } }