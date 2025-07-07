import 'package:flutter/material.dart';
import 'package:mosnad/core/helpers/navigateTo.dart';
import 'package:mosnad/local_auth.dart';
import 'package:mosnad/note/presentation/widgets/bottom_navigation_bar_widget.dart';

class AuthPAge extends StatefulWidget {
  const AuthPAge({super.key});

  @override
  State<AuthPAge> createState() => _AuthPAgeState();
}

class _AuthPAgeState extends State<AuthPAge> {
  var auth;

  _aith()async{
    auth = await LocalAuth.authenticate();
    auth==true?navigateTo(context,BottomNavigationBarWidget()):null;
  }
  @override
  void initState() {

    _aith();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

    );
  }
}

