import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosnad/note/data/model/note_model.dart';
import 'package:mosnad/note/data/repositories/repos.dart';
import 'package:mosnad/locator.dart' as di;

import 'note_state.dart';

final localBasketProvider =
StateNotifierProvider<LocalBasketNotifier, BasketState>(
        (ref) => LocalBasketNotifier(noteReposaitories: di.sl()));

class LocalBasketNotifier extends StateNotifier<BasketState> {
  final NoteReposaitories noteReposaitories;

  LocalBasketNotifier({required this.noteReposaitories})
      : super(BasketState.initial());

  /// The Main Function Of Adding Or Deleting The Basket
  theMainFunction({
    required dynamic reposaitories,
  }) async {
    try {
      await reposaitories;
      state = state.copyWith(
        state: EnumBasketState.addAndDeleteAndUpdateToBasketLocal,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Add To Basket
  functionAddToBasket({
    required NoteModel1 noteModel,
  }) {
    theMainFunction(
        reposaitories: noteReposaitories.addToBasket(noteModel));
  }

  /// get All Basket
  functionGetAllBasket() async {
    try {
      final basketData = await noteReposaitories.getAllBasket();
      state = state.copyWith(
        state: EnumBasketState.addAndDeleteAndUpdateToBasketLocal,
        data: basketData,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  /// Delete A Single Item From The Basket
  functionDeleteASingleItemFromTheBasket({
    required int id,
  }) {
    theMainFunction(
        reposaitories: noteReposaitories.deleteASingleItemFromTheBasket(id));
  }
  functionCatagoris({
    required String catag,
  })async {
    try {
      final basketData = await noteReposaitories.catag(catag);
      state = state.copyWith(
        state: EnumBasketState.addAndDeleteAndUpdateToBasketLocal,
        data: basketData,
      );
    } catch (e) {
      debugPrint(e.toString());
    }

  }
  /// Delete All Elements Of The Basket
  functionDeleteAllElementsOfTheBasket() {
    theMainFunction(
        reposaitories: noteReposaitories.deleteAllElementsOfTheBasket());
  }

}