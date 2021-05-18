import 'package:flutter/material.dart';
class Flipkart extends StatefulWidget {
  @override
  _FlipkartState createState() => _FlipkartState();
}

class _FlipkartState extends State<Flipkart> {
  /*Container _createContainer(mediaQuery, color){
    return   Container(
      color: color,
      width: mediaQuery.width%400,
      height: mediaQuery.height%500,
    );
  }*/
  AppBar _createAppBar(){
    return  AppBar(
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.notifications, size: 30,),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.shopping_cart, size: 30,),
        ),
      ],
      leading: Icon(Icons.menu,),
      elevation: 5,
      title: Text('Flipkart', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var per = 60;
    return Scaffold(
      appBar: _createAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Container(
               width: mediaQuery.width / 3,
               height: mediaQuery.height /3,
               color: Colors.redAccent,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.stretch,
               ),
             ),
             Container(
               width: mediaQuery.width / 3,
               height: mediaQuery.height /3,
               color: Colors.greenAccent,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.stretch,
               ),
             ),
             Container(
               width: mediaQuery.width / 3,
               height: mediaQuery.height /3,
               color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15),
                      width: mediaQuery.width / 2.5,
                      height: mediaQuery.height /40,
                      color: Colors.orange,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      width: mediaQuery.width / 2.5,
                      height: mediaQuery.height /40,
                      color: Colors.yellowAccent,
                    ),
                  ],
                ),
             ),

           ],
          ),
        ),
      )
    );
  }
}
