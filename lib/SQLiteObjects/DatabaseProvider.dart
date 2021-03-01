import 'package:Conalep360/SQLiteObjects/Message.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  // static final DatabaseProvider _instance = new DatabaseProvider.internal();
  // factory DatabaseProvider() => _instance;
  //
  // DatabaseProvider.internal();

  //--------------------------------
  //Obtenemos la instancia de la base de datos
  //----------------------------------
  Database _dataBase;
  // Future<Database> get database async {
  //   if (_dataBase != null) return _dataBase;
  //
  //   _dataBase = await initDB();
  //
  //
  //   return _dataBase;
  // }

  //--------------------------------
  //Inicializamos la base de datos
  //----------------------------------
  initDB() async {

    // String databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'chatConalep.db');

    _dataBase =  await openDatabase('chatConalep.db',
        version: 1, // si se añaden tablas cambiarla,
        // onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE chat (fecha TEXT, mensaje TEXT, nombre TEXT);');
        });
  }

  //--------------------------------
  //Metodo que guarda todos los mensajes en el SQLite
  //----------------------------------
  saveMessage(Message mensaje) async {
    await _dataBase.insert("chat", mensaje.toMap());
  }

  //--------------------------------
  //Metodo que obtiene todos los mensajes del SQLite
  //----------------------------------
  Future<List<Message>> getMessages() async {
    List<Map<String,dynamic>> result = await _dataBase.query('chat');
    return result.map((map) => Message.map(map)).toList();
  }

}