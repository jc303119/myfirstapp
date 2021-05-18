import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/greet.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer timer ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer(Duration(seconds: 4),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> GreetApp()));
    });
  }
  @override
  Widget build(BuildContext context) {
    //const url = 'https://cdn130.picsart.com/297616565009201.jpg?type=webp&to=crop&r=256';
    const url = 'assets/images/rock.jpg';
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              //color: Colors.greenAccent,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.redAccent,
                    Colors.greenAccent,
                    Colors.yellowAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: CircleAvatar(
                maxRadius: 200,
               //backgroundImage: NetworkImage(url),
                backgroundImage: AssetImage(url)
              ),
            ),
            Positioned(
              top: 550,
              left: 100,
              child: Text(
                  'Loading...',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            Positioned(
              top: 50,
              left: 80,
              child: Text(
                  'My Splash Screen',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            )
            //Banner(message: "Brain mentors", location: BannerLocation.topStart,)
          ],
        ),
      ),
    );
  }
}
