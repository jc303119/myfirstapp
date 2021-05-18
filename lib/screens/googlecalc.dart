import 'dart:ui';
import 'package:flutter/material.dart';

class GoogleCalc extends StatefulWidget {
  @override
  _GoogleCalcState createState() => _GoogleCalcState();
}

class _GoogleCalcState extends State<GoogleCalc> {
  var value = '0';
  var output = '0';
  //String operand = '0';

  void _buttonPressed(String button) {
    setState(() {
      if(button == 'AC'){
        value = '0';
        output = '0';
      }
      else if(button == '0' || button == '1' || button == '2' || button == '3' ||button == '4'
          || button == '5' || button == '6' || button == '7' || button == '8' || button == '9'){
        value = button;
      }
      else if(button == '+' || button == '-' || button == 'x' || button == '/'){
        //value += button;
        if(button == '+'){
           value += button;
           value += value;
          output = value;

        }else if(button == '-'){

        }
        print(output);
     }
     else if(button == '='){
       output = value;
       print(output);
     }
      else{
        value = '0';
      }
    });

  }

  Widget _buttonText(String button, {Color color}) {
    return Expanded(
      child: OutlineButton(
        onPressed: () {
          _buttonPressed(button);
        },
        padding: EdgeInsets.all(20),
        child: Text(button,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Calculator'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              color: Colors.red,
              child: Text(
                value,
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.green,
              alignment: Alignment.bottomRight,
              child: Text(
                 output,
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
              child: Divider(),
            ),
//                SizedBox(
//                   height: 230,
//                ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  _buttonText('%'),
                  _buttonText('x'),
                  _buttonText('AC'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  _buttonText('7'),
                  _buttonText('8'),
                  _buttonText('9'),
                  _buttonText('/'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  _buttonText('4'),
                  _buttonText('5'),
                  _buttonText('6'),
                  _buttonText('+'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  _buttonText('1'),
                  _buttonText('2'),
                  _buttonText('3'),
                  _buttonText('-'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  _buttonText('0'),
                  _buttonText('.'),
                  _buttonText('='),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
