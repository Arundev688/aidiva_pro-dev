import 'dart:convert';
import 'dart:io';

import 'package:aidiva_pro/model/Lookupmodel/CountryCodeLengthResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryLookupResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/ErrorResponse.dart';
import 'package:aidiva_pro/model/Lookupmodel/LocaldbModel/Countrycode.dart';
import 'package:aidiva_pro/model/Lookupmodel/LocaldbModel/ErrordataLocal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class Lookuplocaldb {
  Lookuplocaldb._();

  static final Lookuplocaldb db = Lookuplocaldb._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "adivaa.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Errordata ("
              "id INTEGER PRIMARY KEY,"
              "key TEXT,"
              "value TEXT"
              ")");

          await db.execute("CREATE TABLE Countrycode ("
              "id INTEGER PRIMARY KEY,"
              "key TEXT,"
              "value TEXT,"
              "type TEXT"
              ")");

          await db.execute("CREATE TABLE Country ("
              "id INTEGER PRIMARY KEY,"
              "key TEXT,"
              "value TEXT,"
              "type TEXT"
              ")");
        });
  }

  InsertErrordata(int id, String key,String value) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Errordata");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Errordata (id,key,value)"
            " VALUES (?,?,?)",
        [id, key,value]);
    print("insertfromdb"+"true");
    return raw;
  }
  InsertCountryCodedata(String key,String value,String type) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Countrycode");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Countrycode (id,key,value,type)"
            " VALUES (?,?,?,?)",
        [id, key,value,type]);
    print("insertfromdb"+"true");
    return raw;
  }
  InsertCountry(String  key,String value,String type) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Country");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Country (id,key,value,type)"
            " VALUES (?,?,?,?)",
        [id, key,value,type]);

    print("insertfromdb"+"true");
    return raw;
  }
  // blockOrUnblock(Client client) async {
  //   final db = await database;
  //   Client blocked = Client(
  //       id: client.id,
  //       firstName: client.firstName,
  //       lastName: client.lastName,
  //       blocked: !client.blocked);
  //   var res = await db.update("Client", blocked.toMap(),
  //       where: "id = ?", whereArgs: [client.id]);
  //   return res;
  // }
  //
  // updateClient(Client newClient) async {
  //   final db = await database;
  //   var res = await db.update("Client", newClient.toMap(),
  //       where: "id = ?", whereArgs: [newClient.id]);
  //   return res;
  // }
  //
  // getClient(int id) async {
  //   final db = await database;
  //   var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
  //   return res.isNotEmpty ? Client.fromMap(res.first) : null;
  // }

  Future<List<Errordatalocal>> getErrordata() async {
    final db = await database;
    print("works");
     var res = await db.rawQuery("SELECT * FROM Errordata");
    //var res = await db.query("Errordata", where: "blocked = ? ", whereArgs: [1]);
    List<Errordatalocal> list =
    res.isNotEmpty ? res.map((c) => Errordatalocal.fromMap(c)).toList() : [];
    print("printfromlocaldb"+list.toString());
    return list;
  }


  Future<List<Countrycode>> getAllCountrycodedata() async {
    final db = await database;
    print("works");
   // var res = await db.rawQuery("SELECT * FROM Countrycode");
    var res = await db.query("Countrycode",columns: ['id','key','value','type']);
    List<Countrycode> list =
    res.isNotEmpty ? res.map((c) => Countrycode.fromMap(c)).toList() : [];
    // print("printfromlocaldbcountrycode"+list[0].value);
    return list;
  }
  Future<List<Countrycode>> getAllCountry() async {
    final db = await database;
    print("works");
    // var res = await db.rawQuery("SELECT * FROM Countrycode");
    var res = await db.query("Country",columns: ['id','key','value','type']);
    List<Countrycode> list =
    res.isNotEmpty ? res.map((c) => Countrycode.fromMap(c)).toList() : [];
    print("printfromlocaldbcountrycode"+list[0].value);
    return list;
  }
  Future<List<String>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<String> list =
    res.isNotEmpty ? res.map((c) => c['name']) : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }
}