import 'package:flutter/material.dart';
import 'package:list_view/Custom/AppBar.dart';
import 'package:list_view/Custom/Drawer.dart';
import 'package:list_view/globals.dart' as globals;

Route routeToDoPage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ToDoPage(),
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

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  void confirmDelete(int index) {
    setState(() {
      globals.isVisible[index] = false;
    });
    final snackBar = SnackBar(
        content: Text('Element is deleted'),
        action: SnackBarAction(
            label: 'Undo',
            textColor: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                globals.isVisible[index] = true;
              });
            }),
        duration: Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (globals.isVisible[index] == false) globals.toDoList.remove(index);
  }

  Card createCard(int index) {
    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: ListTile(
        title: Text(globals.toDoList[index]),
        leading: IconButton(
            icon: (globals.isDone[index] == false
                ? Icon(Icons.check_box_outline_blank_outlined)
                : Icon(Icons.check_box, color: Colors.green)),
            onPressed: () {
              setState(() {
                globals.isDone[index] = !globals.isDone[index];
              });
            }),
        trailing: IconButton(
            icon: Icon(Icons.delete_outlined, color: Colors.red[600]),
            onPressed: () {
              confirmDelete(index);
            }),
      ),
    );
  }

  Dismissible dismissibleCard(BuildContext context, int index) {
    return Dismissible(
      behavior: HitTestBehavior.translucent,
      background: Container(
        color: Colors.green[400],
        width: 20.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(Icons.archive_outlined, color: Colors.black54, size: 25)
          ]),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red[400],
        width: 20.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Icon(Icons.auto_delete_outlined, color: Colors.black54, size: 25)
          ]),
        ),
      ),
      movementDuration: const Duration(milliseconds: 500),
      key: Key(globals.toDoList[index]),
      child: Column(
        children: [
          Visibility(
              visible: globals.isVisible[index], child: createCard(index)),
        ],
      ),
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.startToEnd) {
        } else {
          confirmDelete(index);
        }
      },
    );
  }

  void onPressedFloatingActionButton(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.3),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextField(
                          autofocus: true,
                          onChanged: (String value) {
                            globals.userToDo = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Something",
                            border: InputBorder.none,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).accentColor)),
                              onPressed: () {
                                setState(() {
                                  globals.toDoList.add(globals.userToDo);
                                  globals.userToDo = '';
                                });
                                globals.isVisible.add(true);
                                globals.isDone.add(false);
                                Navigator.of(context).pop();
                                final snackBar = SnackBar(
                                    content: Text('Element is created'),
                                    duration: Duration(seconds: 2));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Text(
                                'ADD',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Text('PAGE BUILDER');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawerEdgeDragWidth: 100.0,
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: globals.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return dismissibleCard(context, index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Theme.of(context).accentColor),
              child: Icon(Icons.add,
                  size: 40, color: Theme.of(context).backgroundColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              onPressedFloatingActionButton(context);
            }),
      ),
    );
  }
}
