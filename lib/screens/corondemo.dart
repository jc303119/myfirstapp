import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as decode;

import 'package:myfirstapp/models/covidcountry.dart';

class CoronaDemo extends StatefulWidget {
  @override
  _CoronaDemoState createState() => _CoronaDemoState();
}

class _CoronaDemoState extends State<CoronaDemo> {
  String countryName = 'India';
  List<Country> countries = [];

  void initState() {
    super.initState();
    _getCountries();
  }

  _getCountries() async {
    print('Get countries method called');
    String url = 'https://api.covid19api.com/summary';
    Response response = await get(url);
    var list = decode.jsonDecode(response.body);
    print('List of country is ${list['Countries']}');
    //print('Map type :: ${list['Countries'].runtimeType}');   //Map type :: List<dynamic>
    list.forEach((name) {
      Country country = new Country(name['Country'], name['CountryCode'],
          name['Slug'], name['NewConfirmed'], name['TotalConfirmed']);
      countries.add(country);
    });
  }

  List<String> listOfCountries = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "India"
  ];
  _convertListIntoDropDownMenuList() {
    List<DropdownMenuItem<String>> list = listOfCountries
        .map((country) => DropdownMenuItem<String>(
              child: Text(country),
              value: country,
            ))
        .toList();
    return list;
  }

  changeValue(String current) {
    setState(() {
      countryName = current;
    });
  }

   _listTile(Country country) {
    print('ListTile called');
    setState(() {
      return ListTile(
        title: Text(country.country),
        subtitle: Text(country.countryCode),
      );
//        Card(
//          child: ListTile(
//            title: Text(country.country),
//            subtitle: Text(country.countryCode),
//          ),
//        ),
//        Card(
//          child: ListTile(
//            title: Text(country.slug),
//            subtitle: Text(country.countryCode),
//          ),
//        ),
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build method print..');
    var media = MediaQuery.of(context).size;
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
                        margin: EdgeInsets.only(top: 50, left: 40),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Covid-19 Data Analysis',
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
              Container(
                color: Colors.white70,
                child: DropdownButtonFormField(
                  value: countryName,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: _convertListIntoDropDownMenuList(),
                  onChanged: (str) {
                    changeValue(str);
                    // _getCountries(str);
                   // _listTile(str);
                  },
                ),
              ),

              Container(child: ListView.builder(
                itemBuilder: (ctx, index) {
                 return _listTile(countries[index]);
                },
                itemCount: countries.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              )),
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
    Path path = new Path();
    // TODO: implement getClip
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
