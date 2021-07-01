import 'package:flutter/material.dart';
import 'package:list_view/Custom/AppBar.dart';
import 'package:list_view/Custom/Drawer.dart';

Route routeNotePage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => NotePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            expands: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            autofocus: true,
            onChanged: (String value) {},
            decoration: InputDecoration(
              hintText: "Enter Something",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
