import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/bmi%20result/bmi_%20result_screen.dart';

class BmiScreen extends StatefulWidget {

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

 bool isMale = true;
 double height = 120.0;
 int weight = 40;
 int age = 20;

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(()
                          {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0,),
                            color: isMale ? Colors.blue : Colors.grey[400],
                          ),
                          child: Column(
                            children: [
                              Image(
                                image:AssetImage('assets/images/male.png'),
                                height: 90.0,
                                width: 90.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(()
                          {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0,),
                            color: !isMale ? Colors.blue : Colors.grey[400],
                          ),
                          child: Column(
                            children: [
                              Image(
                                image:AssetImage('assets/images/female.png'),
                                height: 90.0,
                                width: 90.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[400],

                  ),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 220.0,
                          min: 80.0,
                          onChanged:(value)
                          {
                            setState(() {

                              height = value;
                            });
                          },
                      ),
                    ],
                  ),
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                             'WEIGHT',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 30.0,
                             ),
                           ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    onPressed: ()
                                    {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  heroTag: weight--,
                                  mini: true,
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                    ),
                                FloatingActionButton(
                                  onPressed: ()
                                  {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  heroTag: weight++,
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                       decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15.0),
                       color: Colors.grey[400],
                         ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: ()
                                  {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  heroTag: age--,
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: ()
                                  {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: age++,
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Container(

            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              height: 50.0,
                onPressed: ()
                {
                  var result = weight / pow(height / 100,2);
                  print(result.round());
                  Navigator.push(
                      context,
                     MaterialPageRoute(
                       builder: (context) =>  BMIResultScreen(
                         result: result.round(),
                         isMale: isMale,
                         age: age,

                       ),
                     ),
                  );
                },
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

