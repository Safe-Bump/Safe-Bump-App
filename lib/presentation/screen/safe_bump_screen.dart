import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/screen/calendar_screen.dart';
import 'package:safe_bump/presentation/screen/dashboard_screen.dart';
import 'package:safe_bump/presentation/screen/profile_screen.dart';
import 'package:safe_bump/presentation/screen/timeline_screen.dart';

class SafeBumpScreen extends StatefulWidget {
  const SafeBumpScreen({Key? key}) : super(key: key);

  @override
  State<SafeBumpScreen> createState() => _SafeBumpScreenState();
}

class _SafeBumpScreenState extends State<SafeBumpScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 25,
          selectedIconTheme:
              Theme.of(context).iconTheme.copyWith(color: Colors.pinkAccent),
          unselectedIconTheme:
              Theme.of(context).iconTheme.copyWith(color: Colors.black),
          items: [
            BottomNavigationBarItem(icon: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.category),
            ), label: "He"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.calendar_today_outlined),
                ), label: "Hey"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.medical_services_outlined),
                ), label: "H"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.person_outline_rounded),
                ), label: "Hi"),
          ]),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: IndexedStack(
          children: [
            const DashboardScreen(),
            const CalendarScreen(),
             TimelineScreen(),
            const ProfileScreen()
          ],
          index: pageIndex,
        ),
      ),
    );
  }
}
