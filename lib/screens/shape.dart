import 'package:flutter/material.dart';
class ShapeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      transform: Matrix4.rotationZ(3.14 / 2),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(color: Colors.blueAccent, blurRadius: 20),
          BoxShadow(color: Colors.redAccent,blurRadius: 20)
        ]
      ),
    );
  }
}
