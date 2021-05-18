 import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../utils/Server.dart';
import 'dart:convert' as jsonobj;
class Crick extends StatefulWidget {
  @override
  _CrickState createState() => _CrickState();
}

class _CrickState extends State<Crick> {
  String _playerName = '';
  _getPlayerId(){
     Future <Response> future = Server.getPlayerId(_playerName);
     future.then((response){
       var json = response.body;
       print('JSON is $json');
       print(json.runtimeType);
       var jsonMap = jsonobj.jsonDecode(json);
       print('JSON Map is $jsonMap');
       print(jsonMap.runtimeType);
       print('PID is ${jsonMap['data'][0]['pid']}');
       int pid = jsonMap['data'][0]['pid'];
       Future<Response> res = _callServer(pid);
       res.then((res2){
         print(res2.body);
         setState(() {
           playerObject = jsonobj.jsonDecode(res2.body);
         });
       }).catchError((err){
           print('Error during Pid call $err');
       });
     }).catchError((e){
       print('Error during get player$e');
     });
  }
  var playerObject ;
  _callServer(int pid){
    print('Server Call Start');
    Future<Response> future = Server.playerInfo(pid);
    print('Server Call Ends');
//    future.then((response){
//      var json = response.body;
//      print('JSON is $json');
//    }).catchError((err){
//      print('Error is $err');
//    });
    return future;
    print('Function Ends');

  }
  @override
  Widget build(BuildContext context) {
    var buttonSize = 100;
    var media = MediaQuery.of(context).size;
    const defaultImage = 'https://image.shutterstock.com/image-vector/businessman-icon-260nw-561625345.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text('Player',),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Container(
                //width: 300,
                width: media.width -  buttonSize,
                padding: EdgeInsets.all(5),
                child: TextField(
                  onChanged: (String str){
                    _playerName = str;
                    print('Change call $_playerName');
                  },
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,size: 24, color: Colors.black),
                    border: OutlineInputBorder(),
                    hintText: 'Type to search',
                    hintStyle: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.yellowAccent,
                  onPressed: (){
                    _getPlayerId();
                  },
                  child: Icon(Icons.search, size: 30, color: Colors.red,),
                ),
              )
            ],
          ),

        ],
      ),
          body:SingleChildScrollView(
            child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.network(playerObject==null?defaultImage:playerObject['imageURL']),
                ),
                Container(
                  child: Text(playerObject==null?'':playerObject['fullName']),
                ),
                Container(
                  child: Text(playerObject==null?'':playerObject['battingStyle']),
                ),
                Container(
                  child: Text(playerObject==null?'':playerObject['born']),
                ),
                Container(
                  child: Text(playerObject==null?'':playerObject['currentAge']),
                ),
//              RaisedButton(
//                onPressed: (){
//                  _callServer();
//                },
//                child: Text('Call Server'),
//              )

              ],
            ),
    ),
          ),
    );
  }
}
