import 'package:doctor/features/home/screens/home_screen.dart';
import 'package:doctor/features/inbox/screens/inbox_screen.dart';
import 'package:doctor/features/my%20appointment/screens/my_appointment_screen.dart';
import 'package:doctor/features/profile/screens/profile_screen.dart';
import 'package:doctor/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color_manger.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    InboxScreen(),
    SearchScreen(),
    MyAppointmentScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => currentIndex = index);
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) => setState(() => currentIndex = index),
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
          onTap: _onItemTapped,
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
              icon: Image.asset("assets/icons/mail-outline.png", height: 24),
              activeIcon: Image.asset(
                "assets/icons/mail-rounded.png",
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
              icon: Icon(Icons.calendar_month_outlined ,color: Colors.black,),
              activeIcon: Icon(Icons.calendar_month_rounded),
              label: "Appointment",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded,color: Colors.black,),
              activeIcon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
