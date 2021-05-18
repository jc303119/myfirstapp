import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<String> images = ['https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
    'https://image.shutterstock.com/image-photo/cheerful-happy-woman-enjoying-shopping-260nw-1417347668.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRQv8F1Em-zeIPMjblqSkRJfC9lmlHg0p0kchqoL8SGGB4126Xl&usqp=CAU'];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    const userImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRJaBifR3vaLnaThPnmGIuRCDhjGtdQA66z9KElRdECzeiWyGuO&usqp=CAU';
    String url = 'https://img.freepik.com/free-photo/colorful-paper- bags-shopping_23-2147652053.jpg?size=626&ext=jpg';
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.view_list,size: 40,color: Colors.redAccent,),
              onPressed: (){
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            actions: <Widget>[Icon(Icons.map),],
            elevation: 5,
            expandedHeight: media.height / 3,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver App Bar'),
              centerTitle: true,
              //background: Image.network(url,fit: BoxFit.fitWidth,),
              background: Swiper(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index)=> Image.network(images[index], fit: BoxFit.cover,),
                autoplay: true,
              )
            ),
          ),
          //_slider()
        ],
      ),
      key: _scaffoldKey,
      drawer:  Drawer(
        elevation: 3,
         child: DrawerHeader(
           child: Column(
             children: <Widget>[
               UserAccountsDrawerHeader(
                 accountName: Text('Jikmat'),
                 accountEmail: Text('jikmat303@gmail.com'),
                 currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(userImage),)
               ),
               InkWell(
                 splashColor: Colors.orangeAccent,
                 onTap: (){},
                 child: ListTile(
                   leading: Icon(Icons.search,),
                   title: Text('Search'),
                 ),
               ),
               InkWell(
                 splashColor: Colors.orangeAccent,
                 onTap: (){},
                 child: ListTile(
                   leading: Icon(Icons.account_balance,),
                   title: Text('Balance'),
                 ),
               ),
               InkWell(
                 splashColor: Colors.orangeAccent,
                 onTap: (){},
                 child: ListTile(
                   leading: Icon(Icons.email,),
                   title: Text('Gmail'),
                 ),
               ),
             ],
           ),
         ),
//        child: ListView(
//          children: <Widget>[
//            ListTile(
//              title: Text('A'),
//            ),
//            ListTile(
//              title: Text('B'),
//            ),
//          ],
//        ),
      ),
    );
  }
}
