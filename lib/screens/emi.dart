import 'dart:math';
import 'package:flutter/material.dart';

class EmiCalc extends StatefulWidget {
  @override
  _EmiCalcState createState() => _EmiCalcState();
}

class _EmiCalcState extends State<EmiCalc> {
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('EMI Calculator'),
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.deepPurple,
          margin: EdgeInsets.all(media.width / 20),
          child: Column(
            children: <Widget>[
                 Row(
                  children: <Widget>[
                    Expanded(
                       flex: 4,
                      child: Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.only(top: media.width / 50),
                        margin: EdgeInsets.only(top: media.width / 50),
                        child: TextField(
                          controller: controller1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Total Amount',
                            hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                            labelText: 'Principle',
                            labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 23),
                          autofocus: true,
                          autocorrect: true,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(top: media.width / 50),
                        margin: EdgeInsets.only(top: media.width / 30),
                        decoration: BoxDecoration(
                          border: Border.all(width: media.width / 500),
                            color: Colors.blueGrey[100]
                        ),
                        child: MaterialButton(
                          elevation: 5,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Rs',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.only(top: media.width / 50),
                      margin: EdgeInsets.only(top: media.width / 50),
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
                        style: TextStyle(fontSize: 23),
                        autofocus: true,
                        autocorrect: true,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(top: media.width / 50),
                      margin: EdgeInsets.only(top: media.width / 30),
                      decoration: BoxDecoration(
                          border: Border.all(width: media.width / 500),
                          color: Colors.blueGrey[100]
                      ),
                      child: MaterialButton(
                        elevation: 5,
                        color: Colors.greenAccent,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '%',style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.only(top: media.width / 50),
                      margin: EdgeInsets.only(top: media.width / 50),
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
                        style: TextStyle(fontSize: 23),
                        autofocus: true,
                        autocorrect: true,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: media.width / 50),
                      margin: EdgeInsets.only(top: media.width / 30),
                      decoration: BoxDecoration(
                        border: Border.all(width: media.width / 600),
                        color: Colors.blueGrey[100]),
                      child: MaterialButton(
                        elevation: 5,
                        child: Text(
                          'Months',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Container(
                margin: EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(media.width / 30),
                      margin: EdgeInsets.only(top: media.width / 50),
                      child: MaterialButton(
                        elevation: 5,
                        color: Colors.blue,
                        onPressed: () {
                          _calculate();
                        },
                        padding: EdgeInsets.all(10),
                        child: Text('Calculate', style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(media.width / 30),
                      margin: EdgeInsets.only(top: media.width / 50),
                      child: MaterialButton(
                        elevation: 5,
                        color: Colors.red,
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
                margin: EdgeInsets.only(top: media.width / 50),
                child: Column(
                  children: <Widget>[
                    Text("Your Monthly Emi is", style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),),
                    Container(
                      //color: Colors.blue,
                      child: Text(_msg, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50),),
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
    //print('calculate result');
    setState(() {
      double e = 0.0;
      int p = int.parse(controller1.text);
      double i = double.parse(controller2.text) / 12 / 100;
      int d = int.parse(controller3.text);
      e = (p * i * pow((1 + i), d) / (pow((1 + i), d) - 1));
      _msg = e.toStringAsFixed(2);
    });
  }

  void _clear() {
    setState(() {
      //controller1.text =' ';
       controller1.clear();
       controller2.clear();
       controller3.clear();
       _msg = ' ';
    });
  }
}
