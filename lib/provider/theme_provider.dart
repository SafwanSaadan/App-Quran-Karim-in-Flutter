import 'package:flutter/material.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData selectedTheme;
  late SharedPreferences prefs;

  ThemeProvider({bool isDark = false}) {
    selectedTheme = isDark ? darkTheme : lightTheme;
  }

  ThemeData get getTheme => selectedTheme;

  Future<void> changeTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (selectedTheme == darkTheme) {
      selectedTheme = lightTheme;
      await prefs.setBool("isDark", false);
    } else {
      selectedTheme = darkTheme;
      await prefs.setBool("isDark", true);
    }
    notifyListeners();
  }
// void toggleTheme({bool isOn = false}) {
//   themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
//   notifyListeners();
// }
}

ThemeData darkTheme = ThemeData(
  platform: TargetPlatform.iOS,
  scaffoldBackgroundColor: ColorManager.black,
  primaryColor: ColorManager.black,
  colorScheme: const ColorScheme.dark(),
  appBarTheme: AppBarTheme(backgroundColor: ColorManager.black),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: ColorManager.white),
    bodyMedium: const TextStyle(
      color: Color(0xffd8d8d8),
    ),
    displayLarge: const TextStyle(
      color: Color(0x801f2226),
    ),
    displayMedium: const TextStyle(
      color: Color(0xcc1f2226),
    ),
  ),
  iconTheme: IconThemeData(color: ColorManager.blueColor),
  listTileTheme: const ListTileThemeData(tileColor: Color(0xff202328)),
  cardColor: const Color(0x80202328),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Color(0xff202328)),
);

ThemeData lightTheme = ThemeData(
  platform: TargetPlatform.iOS,
  scaffoldBackgroundColor: ColorManager.white,
  primaryColor: ColorManager.white,
  colorScheme: const ColorScheme.light(),
  appBarTheme: AppBarTheme(backgroundColor: ColorManager.white),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: ColorManager.black),
    bodyMedium: const TextStyle(
      color: Color.fromARGB(196, 44, 44, 44),
    ),
    displayLarge: const TextStyle(
      color: Color.fromARGB(255, 253, 251, 240),
    ),
    displayMedium: const TextStyle(
      color: Color.fromARGB(255, 253, 247, 230),
    ),
  ),
  iconTheme: IconThemeData(color: ColorManager.blueColor),
  listTileTheme: ListTileThemeData(tileColor: ColorManager.grey),
  cardColor: const Color.fromARGB(255, 253, 251, 240),
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: ColorManager.white),
);
