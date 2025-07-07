import 'package:get_it/get_it.dart';
import 'package:mosnad/note/data/repositories/repos.dart';

import 'note/data/data_sourse/note_hive_local.dart';
import 'note/presentation/riverpod/note_riverpod.dart';

// final locator = GetIt.instance;
//
// void setupLocator() {
//   locator.registerLazySingleton(() => NoteReposaitories());
// }
final sl = GetIt.instance;
  void fuc(){

  }
Future<void> init() async {
  /// Riverpod
  // sl.registerFactory(() => MedicinesNotifier());

  /// User Riverpod
  sl.registerLazySingleton<NoteReposaitories>(() => NoteReposaitoriesImp(
       noteLocalDataSource: sl(),));
  sl.registerLazySingleton(() => NoteLocalDataSource());
  sl.registerFactory(() => LocalBasketNotifier(noteReposaitories: sl()));

}
