import 'package:flutter/material.dart';
import 'package:list_view/Custom/AppBar.dart';
import 'package:list_view/Custom/Drawer.dart';

Route routeArchive() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Archive(),
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

class Archive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawerEdgeDragWidth: 100.0,
      drawer: CustomDrawer(),
      body: Text('Archive'),
    );
  }
}
