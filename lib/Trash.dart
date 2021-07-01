import 'package:flutter/material.dart';
import 'package:list_view/Custom/AppBar.dart';
import 'package:list_view/Custom/Drawer.dart';

class Trash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawerEdgeDragWidth: 100.0,
      drawer: CustomDrawer(),
      body: Text('Trash'),
    );
  }
}
