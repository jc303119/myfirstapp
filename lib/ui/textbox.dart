import 'package:flutter/material.dart';
class TextBox extends StatelessWidget {
  TextEditingController _ctrl;
  String _msg;
  Icon _icon;
  int _fontSize;
  TextBox(TextEditingController ctrl, String msg, {Icon icon, int fontSize}){
    this._ctrl = ctrl;
    this._msg = msg;
    this._icon = icon;
    this._fontSize = fontSize;
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(media.width / 80),
      margin: EdgeInsets.only(top: media.height/80),
      child: TextField(
        controller: _ctrl,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: _icon ?? Icon(Icons.person, size: 40, color: Colors.orangeAccent,),
          labelText: 'Enter your $_msg',
          labelStyle: TextStyle(color: Colors.teal ),
          hintText: 'Type your $_msg',
        ),
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: _fontSize ?? 20,),
        autofocus: true,
        autocorrect: true,
      ),
    );
  }
}
