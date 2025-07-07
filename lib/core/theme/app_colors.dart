import 'package:flutter/material.dart';

/// This class contains all the colors of the app.
class AppColors {
  //Brand Colors
  static const Color greyColor =  Color(0xff143959);
  static const Color scaffoldColor =  Color(0xfffcfcfc);

  static Color dangerColor = const Color(0xffD64545);

  static const Color primaryColor =  Color(0xff1c5948);

  static Color secondaryColor = const Color(0xffeec087);
  static Color brownColor = const Color(0xffbf946f);

  static const MaterialColor primarySwatch = MaterialColor(
    0xff1c5948,
    <int, Color>{
      900: Color(0xff1c5948),
      800: Color(0xff1f604e),
      700: Color(0xff216955),
      600: Color(0xff25765f),
      500: Color(0xff2f9276),
      400: Color(0xff329e80),
      300: Color(0xff33a384),
      200: Color(0xff38b18f),
      100: Color(0xff3aba96),
      50: Color(0xffa3c8be),
    },
  );

  static var darkSwatch = MaterialColor(
    greyColor.value,
    const {
      100: Color(0xffFAFAFA),
      200: Color(0xffeaeaea),
      300: Color(0xffe7e7e7),
    },
  );
  static const MaterialColor secondarySwatch = MaterialColor(
    0xFFBC2A23,
    <int, Color>{
      50: Color(0xFFF8E8E7),
      100: Color(0xFFF2D4D3),
      200: Color(0xFFE4AAA7),
      300: Color(0xFFD77F7B),
      400: Color(0xFFC9554F),
      500: Color(0xFFBC2A23),
      600: Color(0xFF962923),
      700: Color(0xFF712724),
      800: Color(0xFF3C2625),
      900: Color(0xFF413130),
    },
  );

  //Tertary
  static const MaterialColor tertarySwatch = MaterialColor(
    0xFF3D3337,
    <int, Color>{
      50: Color(0xFFF0EFF0),
      100: Color(0xFFD8D6D7),
      200: Color(0xFFB1ADAF),
      300: Color(0xFF8B8587),
      400: Color(0xFF645C5F),
      500: Color(0xFF3D3337),
      600: Color(0xFF2F2328),
      700: Color(0xFF1F1419),
      800: Color(0xFF0D070A),
      900: Color(0xFF000000),
    },
  );

  //grey
  static const MaterialColor greySwatch = MaterialColor(
    0xFFA39F9F,
    <int, Color>{
      50: Color(0xfff8f8f8),
      100: Color(0xFFF0EFEF),
      200: Color(0xFFE9E8E8),
      300: Color(0xFFDAD8D8),
      400: Color(0xFFC6C3C3),
      500: Color(0xFFA39F9F),
      600: Color(0xFF6b6b6b),
      700: Color(0xFF4D4949),
      800: Color(0xFF333232),
      900: Color(0xFF262525),
    },
  );

  //danger
  static const MaterialColor dangerSwatch = MaterialColor(
    0xFFEB4E3D,
    <int, Color>{
      50: Color(0xFFFEF6F0),
      100: Color(0xFFFEE8D8),
      200: Color(0xFFFDCBB2),
      300: Color(0xFFF9A78A),
      400: Color(0xFFF3846C),
      500: Color(0xFFEB4E3D),
      600: Color(0xFFCA2F2C),
      700: Color(0xFFA91E27),
      800: Color(0xFF881324),
      900: Color(0xFF432F2D),
    },
  );

  //success
  static const MaterialColor successSwatch = MaterialColor(
    0xFF35C75A,
    <int, Color>{
      50: Color(0xFFEAFDE7),
      100: Color(0xFFDCFCD7),
      200: Color(0xFFB2F9B0),
      300: Color(0xFF85EE8B),
      400: Color(0xFF63DD76),
      500: Color(0xFF35C75A),
      600: Color(0xFF26AB55),
      700: Color(0xFF1A8F4E),
      800: Color(0xFF107346),
      900: Color(0xFF304133),
    },
  );

  //warning
  static const MaterialColor warningSwatch = MaterialColor(
    0xFFFFCC00,
    <int, Color>{
      50: Color(0xFFFFFCE5),
      100: Color(0xFFFFF9CC),
      200: Color(0xFFFFF099),
      300: Color(0xFFFFE666),
      400: Color(0xFFFFDC3F),
      500: Color(0xFFFFCC00),
      600: Color(0xFFDBAA00),
      700: Color(0xFFB78B00),
      800: Color(0xFF936D00),
      900: Color(0xFF4C442A),
    },
  );

  //info
  static const MaterialColor infoSwatch = MaterialColor(
    0xFF007AFF,
    <int, Color>{
      50: Color(0xFFE5F6FF),
      100: Color(0xFFCCEEFF),
      200: Color(0xFF99D8FF),
      300: Color(0xFF66BDFF),
      400: Color(0xFF3FA4FF),
      500: Color(0xFF007AFF),
      600: Color(0xFF005EDB),
      700: Color(0xFF0046B7),
      800: Color(0xFF003193),
      900: Color(0xFF1E3651),
    },
  );

  //
  // static const Color secondaryColor = Color(0xFFF29030);
  //
  // // static const Color subColor = Color(0xFFFFB71B);
  // // static const Color secondaryColor2 = Color(0xFF2E1A46);
  //
  // //Alert Colors
  static const Color errorColor = Color(0xFFEF5350);

  // static const Color successColor = Color(0xFF26A69A);
  // static const Color warningColor = Color(0xFFFAA61A);
  // static const Color infoColor = Color(0xFF1D89FF);
  //
  // //Text Colors
  static const Color mainColorFont = Color(0xFF000000);
  static const Color secondaryColorFont = Color(0xff616161);

  static Color thirdColorFont = greySwatch.shade600;

  static const Color fourthColorFont = Color(0xFF1E252F);

  //
  // static const Color subColorFont = Color(0xFF7F8384);
  //
  // //input colors
  // static const Color inputFontColor = Color(0xFFCCD3DF);
  static final Color inputFormColor = disabledColor.withOpacity(0.4);

  // static const Color disabledFormColor = Color(0xFFCCD3DF);
  // static final Color inputFormErrorColor = errorColor.withOpacity(0.05);
  //
  // //other colors
  // static const Color iconColor = Color(0xFFBAC1CC);
  // static const Color backgroundColor = Color(0xFFF6F7FA);
  static const Color disabledColor = Color(0xFFEDF0F5);

  // static const Color starsColor = Color(0xFFFED029);
  //
  // // static const Color backgroundColor = Color(0xFFF7F8FA);
  // // static const Color backgroundColor = Color(0xFFFBFBFB);
  // // static const Color backgroundColor = Color(0xFFF6F7FA);
  // static const Color dropShadow = Color(0xFFAEAEAE);
  // static const Color fontColor = Color(0xFFE0E4EC);
  //
  // //colors buttons status
  static final Color secondaryButtonColor = disabledColor.withOpacity(0.4);

  // static const Color primaryColorActive = Color(0xFF462DA2);
  // static const Color secondaryColorActive = Color(0xFFF5BC00);
  static const Color errorColorActive = Color(0xFFA10629);
  static const Color errorColor500 = Color(0xFFEB4E3D);

  // static const Color deactivatedButtonsColor = Color(0xFFE8E8E8);
  //
  // // static Color cancelButtonColor = errorColor.withOpacity(0.1);
  // // static Color cancelButtonColorActive = errorColor.withOpacity(0.12);
  //
  // //
  static const Color whiteColor = Color(0xFFFFFFFF);

  // static final Color testDesginColor = Colors.redAccent.withOpacity(0.2);
  static const Color transparent = Colors.transparent;

  static const Color iconColor = Color(0xFFBAC1CC);
}
