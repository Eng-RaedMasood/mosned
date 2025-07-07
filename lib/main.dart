import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mosnad/core/theme/app_colors.dart';
import 'package:mosnad/note/presentation/pages/auth_page.dart';
import 'package:mosnad/note/presentation/pages/note_page.dart';
import 'core/theme/theme.dart';
import 'locator.dart';
import 'note/data/data_sourse/note_hive_local.dart';
import 'package:mosnad/locator.dart' as di;

import 'note/presentation/riverpod/note_riverpod.dart';
import 'note/presentation/widgets/bottom_navigation_bar_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  await di.init();

  // setupLocator();


  // Hive.registerAdapter(NoteModelAdapter());
  final data = ProviderContainer();
  data
      .read(localBasketProvider.notifier)
      .functionGetAllBasket();
  runApp(UncontrolledProviderScope(container: data, child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: false,
      splitScreenMode: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: AuthPAge(),
      ),
    );
  }
}
