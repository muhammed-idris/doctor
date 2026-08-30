import 'package:doctor/features/home/screens/home_screen.dart';
import 'package:doctor/features/inbox/screens/inbox_screen.dart';
import '../features/my appointment/screens/my_appointment_screen.dart';
import 'package:doctor/features/profile/screens/profile_screen.dart';
import 'package:doctor/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../core/constants/color_manger.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    InboxScreen(),
    SearchScreen(),
    MyAppointmentScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/home-2-outline.png", height: 24),
              activeIcon: Image.asset(
                "assets/icons/home-2-bold.png",
                height: 24,
                color: AppColors.primaryBlue,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/chat-line-linear.png", height: 24),
              activeIcon: Image.asset(
                "assets/icons/chat-line-bold.png",
                height: 24,
                color: AppColors.primaryBlue,
              ),
              label: "Inbox",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/search-normal.png",
                height: 24,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                "assets/icons/search-normal.png",
                height: 24,
                color: AppColors.primaryBlue,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/calendar-linear.png",
                height: 24,
                color: Colors.black,
              ),
              activeIcon: Image.asset(
                "assets/icons/calendar-bold.png",
                height: 24,
                color: AppColors.primaryBlue,
              ),
              label: "Appointment",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded, color: Colors.black),
              activeIcon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}