import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage('assets/images/ibrahim.jpg'),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(onPressed: (){},
            icon: const CircleAvatar(
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child:
        SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'search',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 20.0
                ),
                Container(
                  height: 110.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItem(),
                    separatorBuilder: (context, index) => const SizedBox(width: 15,),
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap:true ,
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder:(context, index) => const SizedBox(height: 15.0,) ,
                    itemCount: 20
                ),
              ]
          ),
        ),
      ) ,
    );
  }

  // build item
  // build list
  // add item to list


  //arrow function

  Widget buildStoryItem() => Container(
    width: 60,
    child: Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/ibrahim.jpg'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 5,
                end: 5,
              ),
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'ibrahim morsy ibrahim morsy',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),



      ],
    ),
  );
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/ibrahim.jpg'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 5,
              end: 5,
            ),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      const SizedBox(
        width: 15,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ibrahim morsy ibrahim morsy ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'hello my best friend hello my best friend hello my best friend hello my best friend',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.black,
                  ),
                ),
                Text(
                  '02:00 pm',
                ),
              ],
            ),

          ],
        ),
      ),

    ],
  );
}

