import 'package:flutter/material.dart';

class ClipDemo extends StatefulWidget {
  @override
  _ClipDemoState createState() => _ClipDemoState();
}

class _ClipDemoState extends State<ClipDemo> {
  List<String> countries = ["India", "USA", "UK", "SriLanka"];
  _convertListIntoDropDownMenuList() {
    List<DropdownMenuItem<String>> list = countries.map((country) => DropdownMenuItem<String>(
          child: Text(country),
          value: country,
        )).toList();
    print('List is $list');
    return list;
  }
String currentValue = 'India';
  changeValue(String current){
    setState(() {
      currentValue = current;
    });
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const url =
        'https://www.syfy.com/sites/syfy/files/styles/1200x680_hero/public/2018/01/he-man.jpg';
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClipPath(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 50),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'He Man',
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  height: media.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(url)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.yellowAccent
                          ])),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: DropdownButtonFormField(
                  value: currentValue,
                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                  items: _convertListIntoDropDownMenuList(),
                  onChanged: (str) {
                      changeValue(str);
                  },
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: media.height / 3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Colors.lightBlueAccent,
                        Colors.yellowAccent
                      ])),
                ),
              ),
              ClipOval(
                child: Image.network(url),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);

//    path.lineTo(size.width, 0);
//    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 60);
//    path.lineTo(0, size.width);

//    path.lineTo(0, size.height-60);
//    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height);
//    path.lineTo(size.width, 0);

//    path.lineTo(20, size.height - 100);
//    path.lineTo(size.width, size.height);
//    path.lineTo(size.width , 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
