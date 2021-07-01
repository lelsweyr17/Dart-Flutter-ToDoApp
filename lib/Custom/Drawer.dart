import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_view/ThemeData.dart';
import 'package:list_view/globals.dart' as globals;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TO DO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          globals.darkMode = !globals.darkMode;
                          if (globals.darkMode == false) {
                            _themeChanger.setLightTheme();
                          } else {
                            _themeChanger.setDarkTheme();
                          }
                        });
                      },
                      icon: (globals.darkMode == false
                          ? Icon(Icons.dark_mode_outlined,
                              color: Theme.of(context).accentColor)
                          : Icon(Icons.light_mode_outlined,
                              color: Theme.of(context).accentColor))),
                ],
              ),
              padding: const EdgeInsets.only(right: 10.0, left: 20.0, top: 10.0)),
           ListTile(
            contentPadding: EdgeInsets.only(right: 18.0, left: 20.0),
            trailing: Icon(Icons.home_outlined,
                color: Theme.of(context).accentColor),
            title: Text('Main'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),    
           ListTile(
            contentPadding: EdgeInsets.only(right: 18.0, left: 20.0),
            trailing: Icon(Icons.home_outlined,
                color: Theme.of(context).accentColor),
            title: Text('List'),
            onTap: () {
              Navigator.pushNamed(context, '/homepage');
            },
          ),    
          ListTile(
            contentPadding: EdgeInsets.only(right: 18.0, left: 20.0),
            trailing: Icon(Icons.archive_outlined,
                color: Theme.of(context).accentColor),
            title: Text('Archive'),
            onTap: () {
              Navigator.pushNamed(context, '/archive');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(right: 15.0, left: 20.0),
            trailing: Icon(Icons.auto_delete_outlined,
                color: Theme.of(context).accentColor),
            title: Text('Trash'),
            onTap: () {
              Navigator.pushNamed(context, '/trash');
            },
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.only(left: 20.0),
            title: Text('About'),
            onTap: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
