import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/theme/colors.dart';

import 'feature/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      debugShowCheckedModeBanner: false,
      theme: _themeDataLight(),
      home: const HomeView(),
    );
  }
}

ThemeData _themeDataLight() => ThemeData(
      primarySwatch: Colors.grey,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.lightGrey,
      textTheme: GoogleFonts.openSansTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.erieBlack2,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.white,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme:
            const IconThemeData(color: AppColor.erieBlack2, size: 32),
        unselectedIconTheme:
            IconThemeData(color: AppColor.erieBlack2.withOpacity(.5), size: 32),
      ),
    );
