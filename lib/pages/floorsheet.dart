import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Floorsheet extends StatefulWidget {
  @override
  _FloorsheetState createState() => _FloorsheetState();
}

class _FloorsheetState extends State<Floorsheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Floorsheet"),
      ),
      body: Container(),
    );
  }
}
