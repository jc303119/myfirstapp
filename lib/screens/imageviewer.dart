import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert' as json;

class ImageViewer extends StatefulWidget {
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  _callServer([String artistName]) async {
    String url =
        "http://api.giphy.com/v1/gifs/search?api_key=OKRR0LyFmuqRddHEvoomA4sQ4LkeKTS1&q=tom and jerry&limit=10";
    Response response = await get(url);
//   print('Response is ${response.body}');
//    var map1 = response.body;
//    print('Map is ${map1.runtimeType}');
    var map = json.jsonDecode(response.body);
    // print('Map is ${map.runtimeType}');
    // String url2 = map['data'][0]['images']['original']['url'];
    // print('Url2 is ${url2}');
    return map; //new Future(response)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Viewer'),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Container(),
              Container(),
            ],
          )
        ],
      ),
      body: FutureBuilder(
          future: _callServer(),
          builder: (BuildContext ctx, AsyncSnapshot snapShot) {
            if (snapShot == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapShot.hasError) {
              return Center(
                child: Text(
                  'Some error occurs',
                  style: TextStyle(fontSize: 32),
                ),
              );
            }
            if (snapShot.hasData) {
              print('Data is ${snapShot.data}');

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Card(
                    child: Image.network(
                      snapShot.data['data'][index]['images']['original']['url'],
                    ),
                  );
                },
                itemCount: snapShot.data.length,
                scrollDirection: Axis.vertical,
              );
//            return ListView.builder(
//             // scrollDirection: Axis.horizontal,
//                itemBuilder: (parent, index) {
//                  return Card(
//                    child: Image.network(
//                      snapShot.data['data'][index]['images']['original']['url'],
//                    ),
//                  );
//                },
//                itemCount: snapShot.data.length
//            );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
