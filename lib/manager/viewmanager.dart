import 'package:flutter/material.dart';

import 'package:flutter_task/Ui/screens/home.dart';
import 'package:flutter_task/Ui/screens/profile.dart';
import 'package:flutter_task/Ui/screens/search.dart';
import 'package:flutter_task/Ui/screens/reels.dart';

class ViewManager extends StatefulWidget {
  const ViewManager({Key? key}) : super(key: key);

  @override
  _ViewManagerState createState() => _ViewManagerState();
}

class _ViewManagerState extends State<ViewManager> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ReelsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        elevation: 0,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
                Icons.video_call,
              size: 25,
              color: Colors.black,
            ),
            label: 'Reels',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
    );
  }
}
