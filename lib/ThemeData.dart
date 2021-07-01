import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    accentColor: Colors.teal[400],
    backgroundColor: Colors.black87,
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal[400],
      shadowColor: Colors.teal[400],
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
    ),
    brightness: Brightness.dark,
  );
}

ThemeData lightTheme() {
  return ThemeData(
    accentColor: Colors.pink[200],
    primaryColor: Colors.white,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink[200],
      shadowColor: Colors.pink[200],
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
    ),
    brightness: Brightness.light,
  );
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setLightTheme() {
    _themeData = lightTheme();
    notifyListeners();
  }

  setDarkTheme() {
    _themeData = darkTheme();
    notifyListeners();
  }
}
