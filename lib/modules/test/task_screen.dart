import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: const Icon(
            Icons.arrow_back_ios,
          color: Colors.grey,
        ),
        title: const Center(
          child: Text(
            'Prisoners List',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      ),
      body:ListView.separated(itemBuilder: (context,index) =>  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: Container(
          padding:const EdgeInsets.all(20.0),
          height:185,
          width: double.infinity,
          decoration:  BoxDecoration(
            borderRadius:BorderRadius.circular(15),
            color: Colors.white,

          ),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Joseph',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Bangaladesh',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],

                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,

                      child: const CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage('assets/images/ibrahim.jpg'),
                      ),
                    ),
                  ),
                ],

              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 7.0,
                width: double.infinity,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff333355),

                ),

              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Text(
                      '2000 AED',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Text(
                      'Coal Completed',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      maxLines:1 ,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                height: 2.0,
                color: Colors.grey[400],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                  'Debt Money raised for Joseph,'
                      'will be released shortly',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
          separatorBuilder: (context,index) =>  const SizedBox(
            height: 11,
          ),
          itemCount: 10,
      ),
    );
  }
}
