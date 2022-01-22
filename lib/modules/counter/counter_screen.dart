import 'package:flutter/material.dart';
// stateless contain one class provide widet


//stateful contain classes
//1 first class provide widget
//2 second class provide state from this widget


class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 1;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: ()
            {
              setState(() {

                counter--;
                print(counter);
              });
            },
              child: const Text(
                'Minus',
                style: TextStyle(
                  fontSize: 30.0,
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0
              ),
              child: Text(
                '$counter',
                style: const TextStyle(
                  fontSize:50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(onPressed: ()
            {
              setState(() {

                counter++;
                print(counter);
              });
            },
              child: const Text(
                  'Plus',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
