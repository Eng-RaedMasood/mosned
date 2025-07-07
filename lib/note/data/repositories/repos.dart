import 'package:mosnad/note/data/data_sourse/note_hive_local.dart';
import 'package:mosnad/note/data/model/note_model.dart';




abstract class NoteReposaitories {
  /// Add To Basket
  Future<void> addToBasket(NoteModel1 noteModel);

  /// get All Basket
  Future<List<NoteModel1>> getAllBasket();
  Future<List<NoteModel1>> catag(String catag);


  /// Delete A Single Item From The Basket
  Future<void> deleteASingleItemFromTheBasket(int id);

  /// Delete All Elements Of The Basket
  Future<void> deleteAllElementsOfTheBasket();

}

class NoteReposaitoriesImp implements NoteReposaitories {
  final NoteLocalDataSource noteLocalDataSource;

  NoteReposaitoriesImp({
    required this.noteLocalDataSource,
  });

  @override
  Future<void> addToBasket(NoteModel1 noteModel) async {
    try {
      await noteLocalDataSource.addToBasket(noteModel);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<NoteModel1>> getAllBasket() async {
    try {
      return await noteLocalDataSource.getAllBasket();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteASingleItemFromTheBasket(int id) async {
    try {
      await noteLocalDataSource.deleteASingleItemFromTheBasket(id);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteAllElementsOfTheBasket() async {
    try {
      await noteLocalDataSource.deleteAllElementsOfTheBasket();
    } catch (e) {
      throw '$e';
    }
  }





  @override
  Future<List<NoteModel1>> catag(String catag)async {
    try {
      return await  noteLocalDataSource.cataggoris(catag);
    } catch (e) {
      throw '$e';
    }
  }



}


