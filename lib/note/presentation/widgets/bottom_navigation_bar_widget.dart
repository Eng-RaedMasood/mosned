
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosnad/core/theme/app_colors.dart';
import 'package:mosnad/note/presentation/riverpod/note_riverpod.dart';

import '../pages/catagoris_page.dart';
import '../pages/note_page.dart';

class BottomNavigationBarWidget extends ConsumerStatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  ConsumerState<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends ConsumerState<BottomNavigationBarWidget> {
  int currentIndex = 0;

  List pages = [
    NotePage(),
    CatagoriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              if (index == 1) {

                ref.read(localBasketProvider.notifier).functionCatagoris(catag: "work");
              }
              else{
                ref.read(localBasketProvider.notifier).functionGetAllBasket();
              }
            });
          },
          backgroundColor: AppColors.primaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          enableFeedback: true,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home_outlined,color: Colors.white,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.category,color: Colors.white,),
              label: 'Catagories',
            ),
          ],
        ));
  }
}
