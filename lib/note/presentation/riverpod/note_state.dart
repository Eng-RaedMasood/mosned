import 'package:dio/dio.dart';
import 'package:mosnad/note/data/model/note_model.dart';

enum EnumBasketState {
  initial,
  loading,
  loaded,
  error,
  addAndDeleteAndUpdateToBasketLocal,
  changes,
}

class BasketState {
  final EnumBasketState state;
  final DioException? exeption;
  List<NoteModel1>? data=[];


  BasketState( {
    required this.state,
    this.exeption,
    this.data,
  });

  factory BasketState.initial() {
    return BasketState(state: EnumBasketState.initial);
  }

  BasketState copyWith({
    required EnumBasketState state,
    DioException? exeption,
    List<NoteModel1>? data,


  }) {
    return BasketState(state: state, exeption: exeption, data: data);
  }
}
