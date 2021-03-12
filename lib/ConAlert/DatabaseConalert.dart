import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'Contacto.dart';

class DatabaseConalert{

  static final DatabaseConalert _instance = DatabaseConalert.internal();
  factory DatabaseConalert() => _instance;

  DatabaseConalert.internal();
  //--------------------------------
  //Obtenemos la instancia de la base de datos
  //----------------------------------
  Database _dataBase;

  Future<Database> get db async{
    if(_dataBase != null){
      return _dataBase;
    }
    _dataBase = await initDB();
    return _dataBase;
  }


  //--------------------------------
  //Inicializamos la base de datos
  //----------------------------------
  initDB() async {

    // String databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'chatConalep.db');

    Directory fileDirectory = await getApplicationDocumentsDirectory();
    String path = join(fileDirectory.path,"Conalert1.db");

    _dataBase =  await openDatabase(path,
        version: 1, // si se añaden tablas cambiarla,
        // onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE conalert (name TEXT, phone TEXT)');
        });
  }

  saveContactos(Contacto contact) async{
    await _dataBase.insert("conalert", contact.toMap());
  }

  //--------------------------------
  //Metodo que obtiene todos los mensajes del SQLite
  //----------------------------------
  Future<List<Contacto>> getContactos() async {
    List<Map<String,dynamic>> result = await _dataBase.query('conalert');
    return result.map((map) => Contacto.map(map)).toList();
  }

  Future close() async{
    var dbClient = await db;
    return await dbClient.close();
  }

}