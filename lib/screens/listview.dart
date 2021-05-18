import 'package:flutter/material.dart';
class ListView extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListView> {
  _listChild(String txt){
    return ListTile(
      leading: Icon(Icons.chat),
      title: Text(txt),
      subtitle: Text(txt),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(

      )),

    );
  }
}
