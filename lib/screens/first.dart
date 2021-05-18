import 'package:flutter/material.dart';

class First extends StatelessWidget{
  AppBar _createAppBar(){
    return AppBar(
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person,size: 30,)),
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.sync,size: 30,))
      ],
      centerTitle: true,
      elevation: 5,
      leading: Icon(Icons.home,color: Colors.black,size: 30,),
      backgroundColor: Colors.redAccent,
      title: Text('My First App', style: TextStyle(fontSize: 30),),
    );
  }
  @override
  Widget build(BuildContext context) {
    const url = 'https://inspirelle.com/wp-content/uploads/2016/09/happy-girl-outside-Yuliya-Evstratenko_shutterstock_309067889.jpg';
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _createAppBar(),
      body: Container(
        //height: 300,
        height: deviceSize.height,
        width: deviceSize.width,
        color: Colors.tealAccent.shade200,
      child: Container(
         //margin: EdgeInsets.only(top: deviceSize.height *0.10),
         // padding: EdgeInsets.all(20),
          child: Image.network(url, fit: BoxFit.fitWidth,
          ),
//          child: Text('Hello My App Demo',
//          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//          ),
        ),
      ),
    );
    /*return SafeArea(
      child: Container(
        color: Colors.blue,
        child: Center(child: Text('My 2020 Application',style: TextStyle(fontSize: 30, color: Colors.red),
        )),
      ),
    );*/
  }
}