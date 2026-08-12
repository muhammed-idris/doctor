import 'package:doctor/features/doctor/widget/dr_sheet_widget.dart';
import 'package:flutter/material.dart' hide FilterChip;


class DrSheet extends StatefulWidget {
  const DrSheet({super.key});

  @override
  State<DrSheet> createState() => _DrSheetState();
}

class _DrSheetState extends State<DrSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 24, 28, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 38),

          const Text(
            'Sort By',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const Divider(),

          const SizedBox(height: 25),

          // Specialty
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Speciality',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 18),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(label: 'All', selected: true),
                FilterChip(label: 'General'),
                FilterChip(label: 'Neurologic'),
                FilterChip(label: 'Pediatric'),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Rating
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Rating',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 18),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RatingChip(label: 'All', selected: true),
                RatingChip(label: '5'),
                RatingChip(label: '4'),
                RatingChip(label: '3'),
                RatingChip(label: '2'),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Done
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
