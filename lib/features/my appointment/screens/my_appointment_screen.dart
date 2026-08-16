import 'package:doctor/features/my%20appointment/widgets/cancelled_card.dart';
import 'package:doctor/features/my%20appointment/widgets/completed_card.dart';
import 'package:doctor/features/my%20appointment/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../shared/back_app_bar.dart';

class MyAppointmentScreen extends StatefulWidget {
  const MyAppointmentScreen({super.key});

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {
  final List<String> types = [
    "Upcoming",
    "Completed",
    "Cancelled",
  ];

  final PageController pageController = PageController();

  int selectedIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Scaffold(
      appBar: BackAppBar(
        appBarTitle: "My Appointment",
        showBackButton: false,
        button: Image.asset(
          "assets/icons/search-normal.png",
          height: 24,
          color: glass.textPrimary,
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          top: height * 0.03,
        ),

        child: Column(
          children: [
            // Tabs
            Row(
              children: List.generate(
                types.length,
                    (index) {
                  final isSelected = selectedIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });

                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.grey.shade200,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                        ),
                        child: Text(
                          types[index],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.blue
                                : Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Pages
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: const [
                  UpcomingCard(),

                  CompletedCard(),

                  CancelledCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}