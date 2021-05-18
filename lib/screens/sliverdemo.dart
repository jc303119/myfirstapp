import 'package:flutter/material.dart';
class SliverDemo extends StatefulWidget {
  @override
  _SliverDemoState createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  var products =["Shirts","Jackets", "Jeans","Shoes"];
  @override
  Widget build(BuildContext context) {
    String url = 'https://img.freepik.com/free-photo/colorful-paper-bags-shopping_23-2147652053.jpg?size=626&ext=jpg';
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
            //  titleSpacing: 30,
              pinned: true,
//              floating: true,
//              snap: true,
            leading: Icon(
                Icons.home,
              color: Colors.redAccent,
            ),
              actions: <Widget>[Icon(Icons.map),],
              elevation: 5,
              expandedHeight: media.height / 3,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Sliver App Bar'),
                centerTitle: true,
               background: Image.network(url,fit: BoxFit.fitWidth,),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.orangeAccent,
                child: Text('Clothings', style: TextStyle(fontSize: 30),),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return Card(
                  child: Text(products[index],style: TextStyle(fontSize: 30),),
                );
              },childCount: products.length),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.orangeAccent,
                child: Text('Clothings', style: TextStyle(fontSize: 30),),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, mainAxisSpacing: 10,
                  crossAxisSpacing: 10,childAspectRatio: 4),
              delegate: SliverChildBuilderDelegate((context, index){
                return Card(
                  child: Text(products[index],style: TextStyle(fontSize: 30),),
                );
              },childCount: products.length),
            ),
            SliverFillRemaining(),
          ],
        ),
      ),
    );
  }
}
