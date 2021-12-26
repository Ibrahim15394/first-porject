import 'package:first_project/modules/main_tasks/main_screen.dart';
import 'package:first_project/modules/main_tasks/messages_tasks/messages_screen.dart';
import 'package:first_project/modules/notifications_asks/notifications_screen.dart';
import 'package:first_project/modules/setting_tasks/setting_screen.dart';
import 'package:first_project/modules/weekly%20plans%20_tasks/weeklyplans_screen.dart';
import 'package:flutter/material.dart';

class LearnyHome extends StatefulWidget {
  const LearnyHome({Key? key}) : super(key: key);

  @override
  _LearnyHomeState createState() => _LearnyHomeState();
}

class _LearnyHomeState extends State<LearnyHome> {
  int currentIndex = 0;
  final List<Widget> screens =
  [
    const SettingScreen(),
    const NotificationsScreen(),
    const MessagesScreen(),
    const  WeekPlansScreen(),
    const MainScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(  backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(
            Icons.add_rounded
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index)
        {
          setState(() {
            currentIndex = index;

          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz_outlined,
            ),
            label: 'المزيد',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'الاشعارات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons. message_outlined ,
            ),
            label: 'الرسائل',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.margin_outlined,
            ),
            label: 'الخطط الاسبوعية',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_sharp ,
            ),
            label: 'الرئيسية',
          ),
        ],

      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'LearnyHome',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 30.0,
          ),

        ),
      ),
      body: screens[currentIndex],


    );
  }
}
