import 'package:final_exam/screens/dashboard_screen.dart';
import 'package:final_exam/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // shows dynamic screen content based on btotom navbar index
    Widget getContent(index) {
      Widget widget = const DashboardScreen();
      switch (index) {
        case 0:
          widget = const DashboardScreen();
          break;
        case 1:
          widget = const ProfileScreen();
          break;
        default:
          widget = const DashboardScreen();
          break;
      }
      return widget;
    }

    // AppBar getAppbar() {
    //   String title;

    //   switch (currentIndex) {
    //     case 0:
    //       title = 'Home';
    //     case 1:
    //       title = 'Profile';
    //     default:
    //       title = 'IBARA';
    //   }

    //   return AppBar(
    //     automaticallyImplyLeading: false,
    //     iconTheme: Theme.of(context).iconTheme,
    //     title: Text(
    //       title,
    //       style: const TextStyle(
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //     centerTitle: true,
    //   );
    // }

    return Scaffold(
      // appBar: getAppbar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: const Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: const Icon(Icons.person),
            ),
          )
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      body: getContent(currentIndex),
    );
  }
}
