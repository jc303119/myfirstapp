import 'dart:math';

import 'package:flutter/material.dart';

class EmiCal extends StatefulWidget {
  @override
  _EmiCalState createState() => _EmiCalState();

}

class _EmiCalState extends State<EmiCal> {
  String _msg  =' ';
  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Calculator'),
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(media.width / 20),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Total Amount',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                    labelText: 'Principle',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 15),
                  autofocus: true,
                  autocorrect: true,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: controller2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Rate of Interest',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                    labelText: 'Interest',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 15),
                  autofocus: true,
                  autocorrect: true,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: controller3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Total no of Months',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                    labelText: 'Duration',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 15),
                  autofocus: true,
                  autocorrect: true,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(media.width / 20),
                      margin: EdgeInsets.only(top: media.width / 50),
                      child: MaterialButton(
                        elevation: 5,
                        color: Colors.blueGrey,
                        onPressed: () {
                          _calculate();
                        },
                        padding: EdgeInsets.all(10),
                        child: Text('Calculate', style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(media.width / 20),
                      margin: EdgeInsets.only(top: media.width / 50),
                      child: MaterialButton(
                        elevation: 5,
                        color: Colors.blueGrey,
                        onPressed: () {
                          _clear();
                        },
                        padding: EdgeInsets.all(10),
                        child: Text('Clear', style: TextStyle(fontSize: 20),),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: media.width / 10),
                child: Column(
                  children: <Widget>[
                    Text("Your Emi is", style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold,color: Colors.redAccent),),
                    Container(
                      //color: Colors.blue,
                      child: Text(_msg, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  void _calculate() {
    setState(() {
      double e = 0.0;
      int p = int.parse(controller1.text);
      double i = double.parse(controller2.text) / 12 / 100;
      int d = int.parse(controller3.text);
      e = (p * i * pow((1 + i), d) / (pow((1 + i), d) - 1));
      _msg = e.toStringAsFixed(2);
    });
  }
  void _clear(){
    setState(() {
      //controller1.text =' ';
      controller1.clear();
      controller2.clear();
      controller3.clear();
      _msg = ' ';
    });
  }
}
