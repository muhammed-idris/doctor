import 'package:flutter/material.dart';

class DoctorTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const DoctorTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  final List<String> tabs = const ['About', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedIndex == index;

        return Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(index),

            child: Container(
              height: 50,

              alignment: Alignment.center,

              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? Colors.blue : Colors.grey.shade200,

                    width: isSelected ? 2 : 1,
                  ),
                ),
              ),

              child: Text(
                tabs[index],

                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.grey,

                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
