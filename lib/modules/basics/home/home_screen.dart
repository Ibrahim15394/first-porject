import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text("first flutter"
        ),
        actions: [
          IconButton(
              icon:const Icon(Icons.search,
              ),
              onPressed: (){
                debugPrint('hello');
              }
          ),
          IconButton(

            icon: const Icon(
              Icons.notification_important,
            ),
            onPressed: (){
              debugPrint('hi');
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const Image(
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: const Text(
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