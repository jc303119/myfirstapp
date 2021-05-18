import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    const url = 'data:image/jpeg;base64,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';
    var per = 400;
    return Scaffold(
        body: SafeArea(
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                //margin: EdgeInsets.only(top: mediaQuery.height/50),
                //color: Colors.orangeAccent,
                width: mediaQuery.width % per,
                height: mediaQuery.height % per,
                padding: EdgeInsets.only(bottom: mediaQuery.height *5),
                child: Image.network(url, fit: BoxFit.fill,),
              ),
              Container(
                   color:  Colors.white,
                  width: mediaQuery.width%50,
                  height: mediaQuery.height%500,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: ' What it takes to be in the slips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                      TextSpan(text: '\nSagar Chawla ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.blueAccent,)),
                      TextSpan(text: '\nThu,May 14 8:55 AM ', style: TextStyle(fontSize: 20,color: Colors.black)),
                      TextSpan(text: '\nStanding in the slips has taken its toll on Ollie \nRayner. I have bust all my '
                          'backs \nin pieces, I have had \na knee operation, I have had injections in my hips,"'
                          ' he protests. Yet even \n after this beating that his body has taken, Rayner cant '
                          'hide the thrill associated with the\n job.\n\n"There are very few things better than taking'
                          '\n a good slip catch," he tells Cricbuzz as he reflects on his time in the cordon,which'
                          '\nearned him the reputation of being one of\n the best in Endlands county circuit over the'
                          'last decade. Angus Fraser hailed him as the best second-slipper hes seen "Its a brilliant'
                          'feeling which you cant explain ', style: TextStyle(fontSize: 20, color: Colors.black,fontStyle: FontStyle.normal),),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
