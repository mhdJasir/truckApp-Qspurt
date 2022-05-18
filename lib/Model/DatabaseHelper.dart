


import 'package:sqflite/sqflite.dart';

 Database _db;

initDb()async{
 _db= await openDatabase('driver.db',version: 1,onCreate:(Database db,int version){
    db.execute('CREATE TABLE driver (id INTEGER PRIMARY KEY, name TEXT,date TEXT)');
  });
}

insertData(name,date)async{
  await _db.rawInsert('INSERT INTO driver(name, date) VALUES("$name","$date")');
}

Future<List<Map<String, Object>>> readData()async{
  List<Map<String, Object>> list;
  list=await _db.rawQuery('SELECT * FROM driver');
  return list;
}

 deleteData()async{
  var count = Sqflite
       .firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM driver'));
   await _db
       .rawDelete('DELETE FROM driver WHERE id = ?', [count]);
 }