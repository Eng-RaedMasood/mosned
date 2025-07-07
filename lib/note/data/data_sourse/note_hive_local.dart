// import 'package:hive/hive.dart';
// import 'package:mosnad/note/data/model/note_model.dart';
//
// class NoteHiveLocal {
//   //singleton
//   static final NoteHiveLocal _cartHive = NoteHiveLocal._internal();
//
//   factory NoteHiveLocal() => _cartHive;
//
//   NoteHiveLocal._internal();
//
//   Future<void> init() async {
//     await Hive.openBox<NoteModel>('company_cart');
//   }
//
//   //get company data
//   Future<NoteModel?> get() async {
//     final box = await Hive.openBox<NoteModel>('company_cart');
//     return box.get('company');
//   }
//
//   //add  data
//   Future<void> set(Map<String, dynamic> data) async {
//     final box = await Hive.openBox<NoteModel>('company_cart');
//
//     final products =  box.values.toList();
//     products.add(NoteModel.fromJson(data));
//      cart = cart.copyWith(id: products);
//
//     // List<NoteModel> note=data;
//     await box.put('company', products  );
//     // var cart = box.get('company');
//     //
//     // // await box.addAll( NoteModel.fromJson(data) );
//     // if (cart == null) {
//     //   cart = NoteModel.fromJson(data) ;
//     //   await box.put('company', cart);
//     // }
//     // else{
//     //
//     //
//     //   // final products = List<NoteModel>.from(cart.copyWith(products: data.));
//     //   // products.add(NoteModel.fromJson(data));
//     //   // await box.put('company', );
//     //
//     // }
//   }
//
//   //remove company data
//   Future<void> removeCompany() async {
//     final box = await Hive.openBox<NoteModel>('company_cart');
//     await box.delete('company');
//   }
//
//   //clear all data
//   Future<void> clear() async {
//     final box = await Hive.openBox<NoteModel>('company_cart');
//     await box.clear();
//   }
// }
//
// class NoteModelAdapter extends TypeAdapter<NoteModel> {
//   @override
//   final int typeId = 1;
//
//   @override
//   NoteModel read(BinaryReader reader) {
//     var a = <String, dynamic>{};
//     reader.readMap().forEach((key, value) {
//       a[key.toString()] = value;
//     });
//     return NoteModel.fromJson(a);
//   }
//
//   @override
//   void write(BinaryWriter writer, NoteModel obj) {
//     writer.writeMap(obj.toJson());
//   }
// }
//

import 'package:mosnad/note/data/model/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteLocalDataSource {
  static final NoteLocalDataSource _instace = NoteLocalDataSource._();

  factory NoteLocalDataSource() => _instace;

  NoteLocalDataSource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'note9.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE notes8 (id INTEGER PRIMARY KEY , title TEXT,'
      ' note TEXT, work STRING, personal TEXT,'
      ' ideas STRING )',
    );
  }

  Future<int> addToBasket(NoteModel1 basketModel) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn
            .rawInsert('INSERT INTO notes8 '
                '(title,note,work,personal,ideas)'
                'VALUES("${basketModel.title}","${basketModel.note}","${basketModel.work}",'
                '"${basketModel.personal}","${basketModel.ideas}")')
            .then(
          (value) {
            print(value);
            return Future.value(value);
          },
        );
      },
    );
  }

  Future<List<NoteModel1>> getAllBasket() async {
    final db = await database;
    final List<Map<String, dynamic>> data = await db.query("notes8");
    return List.generate(
      data.length,
      (index) => NoteModel1.fromJson(data[index]),
    );
  }

  Future<int> updateTheOrderCountAndUpdateTotalPrice(
      int id, int countOrder, double theTotalPriceOfOneTypeOfMedicine) async {
    final db = await database;
    return db.rawUpdate(
      'UPDATE notes8 SET countOrder= ?, theTotalPriceOfOneTypeOfMedicine= ? WHERE id= ? ',
      [countOrder, theTotalPriceOfOneTypeOfMedicine, id],
    );
  }

  Future<List<NoteModel1>> cataggoris(String catag) async {
    final db = await database;
    final List<Map<String, dynamic>> data = await db.rawQuery(
      'SELECT * FROM notes8 WHERE $catag = ? ',
      [catag],
    );
    return List.generate(
      data.length,
      (index) => NoteModel1.fromJson(data[index]),
    );
    // return  db.rawQuery("");
  }

  Future<int> deleteASingleItemFromTheBasket(int id) async {
    final db = await database;
    return db.delete(
      "notes8",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllElementsOfTheBasket() async {
    final db = await database;
    return db.delete(
      "notes8",
    );
  }
}

