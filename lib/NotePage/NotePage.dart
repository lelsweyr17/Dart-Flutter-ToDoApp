import 'package:flutter/material.dart';
import 'package:list_view/Custom/AppBar.dart';
import 'package:list_view/Custom/Drawer.dart';
import 'package:list_view/MainPage/MainPage.dart';

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
  String _note = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.keyboard_backspace_outlined),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(routeMainPage());
                });
              }),
          iconTheme: IconThemeData(
              color: Theme.of(context).backgroundColor, opacity: 0.7),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)))),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: TextField(
          onChanged: (String value) {
            setState(() {
              _note = value;
            });
          },
          cursorColor: Theme.of(context).accentColor,
          toolbarOptions: ToolbarOptions(
            copy: true,
            paste: true,
            cut: true,
            selectAll: true,
          ),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: 'Text',
              hintStyle: TextStyle(fontSize: 20),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
