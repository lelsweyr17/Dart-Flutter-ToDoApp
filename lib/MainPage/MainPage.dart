import 'package:flutter/material.dart';
import 'package:list_view/Custom/AppBar.dart';
import 'package:list_view/Custom/Drawer.dart';
import 'package:list_view/ToDoPage/ToDoPage.dart';
import 'package:list_view/NotePage/NotePage.dart';
import 'package:circular_menu/circular_menu.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

Route routeMainPage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
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

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawerEdgeDragWidth: 100.0,
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
        child: CircularMenu(
          radius: 70,
          alignment: Alignment.bottomRight,
          startingAngleInRadian: 3.34,
          endingAngleInRadian: 4.51,
          curve: Curves.easeIn,
          reverseCurve: Curves.easeOut,
          toggleButtonColor: Theme.of(context).accentColor,
          toggleButtonIconColor: Theme.of(context).backgroundColor,
          toggleButtonAnimatedIconData: AnimatedIcons.menu_close,
          toggleButtonBoxShadow: [
            BoxShadow(color: Theme.of(context).backgroundColor)
          ],
          items: [
            CircularMenuItem(
                boxShadow: [
                  BoxShadow(color: Theme.of(context).backgroundColor)
                ],
                icon: Icons.list_alt_outlined,
                color: Colors.green,
                onTap: () {
                  Navigator.of(context).push(routeToDoPage());
                }),
            CircularMenuItem(
                boxShadow: [
                  BoxShadow(color: Theme.of(context).backgroundColor)
                ],
                icon: Icons.note_alt_outlined,
                color: Colors.amber,
                onTap: () {
                  Navigator.of(context).push(routeNotePage());
                }),
          ],
        ),
      ),
    );
  }
}
