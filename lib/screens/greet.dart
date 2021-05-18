import 'package:flutter/material.dart';
import '../utils/stringoperations.dart';
import '../ui/textbox.dart';
import '../ui/button.dart';
import './shape.dart';
class GreetApp extends StatefulWidget {
  @override
  _GreetAppState createState() => _GreetAppState();
}

class _GreetAppState extends State<GreetApp> {
  String _msg = 'Hello';
  @override
  Widget build(BuildContext context) {
    print("Build Called");
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Greet App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: media.height / 60),
          child: Column(
            children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                     Text('Greet App',
                     style: TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                         fontStyle: FontStyle.italic,
                     color: Colors.red),
                     )
                 ],
               ),
             TextBox(_firstCtrl, 'First Name'),
             TextBox(_secondCtrl, 'Last Name'),

             SizedBox(
               height: 30,
             ),

             Row(
               children: <Widget>[
                 Button(
                   'Say Welcome',
                   _sayWelcome,
                   flex: 2,
                   color: Colors.red,
                 ),
                 Button(
                   'Clear All ',
                   _clear,
                 )
               ],
             ),

             /* Container(
                padding: EdgeInsets.all(media.width / 80),
                margin: EdgeInsets.only(top: media.height/80),
                child: TextField(
                    controller: _firstCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, size: 40, color: Colors.orangeAccent,),
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.teal ),
                      hintText: 'Enter your First Name',
                  ),
                   keyboardType: TextInputType.text,
                   style: TextStyle(fontSize: 20,),
                   autofocus: true,
                   autocorrect: true,

                ),
              ),*/
             /* Container(
                padding: EdgeInsets.all(media.width / 90),
                margin: EdgeInsets.only(top: media.height/90),
                child: TextField(
                  controller: _secondCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, size: 40, color: Colors.orangeAccent,),
                    labelText: 'Second Name',
                    labelStyle: TextStyle(color: Colors.teal ),
                    hintText: 'Enter your Last Name',
                  ),
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20,),
                  autofocus: true,
                  autocorrect: true,
                ),
              ),*/
              /*Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(media.width / 50),
                  child: MaterialButton(
                    elevation: 5,
                    color: Colors.redAccent,
                    onPressed: (){
                      _sayWelcome();
                    },
                    padding: EdgeInsets.all(10),
                    child: Text('Say Welcome', style: TextStyle(fontSize: 20),),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: MaterialButton(
                    elevation: 5,
                    color: Colors.redAccent,
                    onPressed: (){
                      _clear();
                    },
                    padding: EdgeInsets.all(10),
                    child: Text('Clear', style: TextStyle(fontSize: 20),),
                  ),
                ),
              ),*/
              /*Container(
                padding: EdgeInsets.all(media.width / 50),
                child: MaterialButton(
                  elevation: 5,
                  color: Colors.redAccent,
                  onPressed: (){
                    _sayWelcome();
                  },
                  padding: EdgeInsets.all(10),
                  child: Text('Say Welcome', style: TextStyle(fontSize: 20),),),
              ),
              Container(
                padding: EdgeInsets.all(media.width / 50),
                child: MaterialButton(
                  elevation: 5,
                  color: Colors.redAccent,
                  onPressed: (){
                    _sayWelcome();
                  },
                  padding: EdgeInsets.all(10),
                  child: Text('Clear', style: TextStyle(fontSize: 30),),),
              ),*/
              Container(
                margin: EdgeInsets.only(top: media.width / 50),
                child: Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.lightGreen,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(_msg, style: TextStyle(fontSize: 30),),
                  ),
                ),
              ),
              ShapeDemo()
            ],
          ),
        ),
      ),
    );
  }
   TextEditingController _firstCtrl = TextEditingController();
   TextEditingController _secondCtrl = TextEditingController();
  void _sayWelcome() {
    String firstName = _firstCtrl.text;
    String lastName = _secondCtrl.text;
    setState(() {
      _msg = "Welcome ${ StringOperations.initCap(firstName)} ${ StringOperations.initCap(lastName)} !";

    });
  // _msg = "Welcome ${ StringOperations.initCap(firstName)} ${ StringOperations.initCap(lastName)}";
    print('Welcome' +_msg);
  }

  void _clear() {
    setState(() {
      _firstCtrl.clear();
      _secondCtrl.clear();
      //_firstCtrl.text = ' ';
      _msg = ' ';
    });

  }
}
