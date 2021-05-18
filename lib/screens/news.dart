import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myfirstapp/utils/Server.dart';
import 'dart:convert' as jsonObj;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> listOfNews =[];
  void _getNews() {
    print('getNews is called');
    Future<Response> future = Server.getNews();
    future.then((response) {
      Map<String, dynamic> map = jsonObj.jsonDecode(response.body);  //dynamic becoz values can be anything i.e int, string, null
      print('json map is ${map['articles'][0]}');
      setState(() {
        listOfNews = map['articles'];
      });
    }).catchError((e) {
      print('Error during get News $e');
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Init state call once your app loaded') ;
    _getNews();
  }
  List<Widget> createNewsRows(){
    List<Widget> rows = listOfNews.map((currentNews){   //to convert the map data into widget so it can be shown on the screen
      String authorName = currentNews['author'];
      String  titleName = currentNews['title'];
      String  url = currentNews['urlToImage'];
      String content = currentNews['content'];
      String url1 = currentNews['url'];
      Row row = Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.network(url),
          ),
          Expanded(
            flex: 2,
            child: Text(titleName)
          ),
          Container(
            child: Text(url),
          )
        ],
      );
      return Padding(padding: EdgeInsets.all(5), child: row);
      //return row;
    }).toList();
    return rows;
  }

Widget prepareNews(){
    List<Widget> widgets = [];
    if(listOfNews.length == 0){
//      widgets.add(Center(
//        child: CircularProgressIndicator(),
//      ));
    return Container(
      width: media.width,
      height: media.height,
      child: Center(
          child: CircularProgressIndicator(),
        ),
    );
    }else{
      return
     Column(
       children: createNewsRows(),
     );
      //widgets.add(Text('Data is here', style: TextStyle(fontSize: 30),));
    }
    //return widgets;
  }
  var media;
  @override
  Widget build(BuildContext context) {
     media = MediaQuery.of(context).size;
    print('Build call during rendering time after init call');

    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: prepareNews(),
        ),
      ),
    );
  }
}

//Column(
//children: prepareNews(),
//),