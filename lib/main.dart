import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      title: "Flutter List View",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  List<Widget> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < _list.length; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onPressed() {
    Widget child = _newItem(counter);
    setState(() {
      _list.add(child);
    });
  }

  Widget _newItem(int i) {
    Key key = Key("item_$i");
    Container child = Container(
      key: key,
      padding: new EdgeInsets.all(10.0),
      child: Chip(
        label: Text("$i Chip"),
        onDeleted: () => _removeItem(key),
        deleteButtonTooltipMessage: "Delete",
        deleteIconColor: Colors.red,
        avatar: CircleAvatar(
          backgroundColor: Colors.yellow.shade50,
          child: Text("$i"),
        ),
      ),
    );

    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chips"),
        backgroundColor: Colors.teal.shade200,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Add widgets",
        onPressed: _onPressed,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: _list,
          ),
        ),
      ),
    );
  }
}
