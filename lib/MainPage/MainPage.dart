import 'package:flutter/material.dart';
import 'package:list_view/Custom/AppBar.dart';
import 'package:list_view/Custom/Drawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  void  createNewContainer() {
    Container(
      height: 75,
      width: 75,
      color: Colors.amber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawerEdgeDragWidth: 100.0,
      drawer: CustomDrawer(),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Theme.of(context).accentColor),
              child: Icon(Icons.add, size: 40, color: Theme.of(context).backgroundColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              createNewContainer();
              Navigator.pushNamed(context, '/homepage');
            },
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Text('Main')
    );
  }
}
