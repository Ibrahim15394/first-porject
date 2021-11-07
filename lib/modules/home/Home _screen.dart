import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        leading: Icon(
         Icons.menu,
        ),
        title: Text("first flutter"
            ),
        actions: [
         IconButton(
          icon:Icon(Icons.search,
          ),
          onPressed: (){
          print("hello");
          }
        ),
        IconButton(

         icon: Icon(
            Icons.notification_important,
          ),
          onPressed: (){
           print("hi");
          },
        ),
      ],
      ),
      body: Column(
        children:
        [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20.0),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image(
                    image:NetworkImage(
                      "https://www.gardendesign.com/pictures/images/675x529Max/site_3/helianthus-yellow-flower-pixabay_11863.jpg"
                  ),
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
       ),
                Container(
                  width: 250,
                  color: Colors.black.withOpacity(.5) ,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Text(
                    "Flower",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.tealAccent,

                    ),

                  ),
                ),

              ],
            ),
          ),
        ),
        ],
        ),
      );

  }
}