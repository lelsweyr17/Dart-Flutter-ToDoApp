import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_view/HomePage/HomePage.dart';
import 'package:list_view/MainPage/MainPage.dart';
import 'package:list_view/ThemeData.dart';
import 'package:list_view/Archive.dart';
import 'package:list_view/Trash.dart';

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      initialRoute: '/homepage',
      routes: {
        '/': (context) => MainPage(),
        '/homepage': (context) => HomePage(),
        '/archive': (context) => Archive(),
        '/trash': (context) => Trash(),
      },
      theme: theme.getTheme());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (context) => ThemeChanger(lightTheme()),
      child: MaterialAppWithTheme(),
    );
  }
}

void main() => runApp(MyApp());
