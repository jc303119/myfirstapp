import 'package:flutter/material.dart';
class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  Container _createContainer (mediaQuery,color){
    return Container(
      color: color,
      width: mediaQuery.width%70,
      height: mediaQuery.height%70,
    );
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var per = 60;
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Demo'),),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: mediaQuery.height/2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _createContainer(mediaQuery, Colors.redAccent),
                    _createContainer(mediaQuery, Colors.orangeAccent),
                  ],
                ),
              ),
                _createContainer(mediaQuery, Colors.greenAccent),
                _createContainer(mediaQuery, Colors.blueAccent)
//            Container(
//             color: Colors.greenAccent,
//              width: mediaQuery.width%per,
//              height: mediaQuery.height%per,
//           ),
//          Container(
//            color: Colors.blueAccent,
//            width: mediaQuery.width%per,
//            height: mediaQuery.height%per,
//          )
          ],
        ),
      ),
    );
  }
}
