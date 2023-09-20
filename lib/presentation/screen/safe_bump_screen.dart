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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(highlightColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(                                           
            topLeft: Radius.circular(15),                                            
            topRight: Radius.circular(15),                                           
          ),
          child: BottomNavigationBar(
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
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard_outlined),
                    tooltip: 'Dashboard',
                    label: "dashboard"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_outlined),
                    tooltip: 'Calendar',
                    label: "calendar"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.view_timeline_outlined),
                    tooltip: 'Timeline',
                    label: "timeline"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded),
                    tooltip: 'Profile',
                    label: "person"),
              ]),
        ),
      ),
      body: IndexedStack(
        index: pageIndex,
        children: const [
          DashboardScreen(),
          CalendarScreen(),
          TimelineScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
