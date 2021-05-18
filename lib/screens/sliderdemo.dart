import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  _slider(media){
    return  Container(
        height: media.height / 3,
        width: media.width,
        child: Carousel(
          images: [
            NetworkImage('https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
            NetworkImage('https://image.shutterstock.com/image-photo/cheerful-happy-woman-enjoying-shopping-260nw-1417347668.jpg'),
            NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRQv8F1Em-zeIPMjblqSkRJfC9lmlHg0p0kchqoL8SGGB4126Xl&usqp=CAU'),
          ],
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _slider(media),
          ],
        ),
      ),
    );
  }
}
