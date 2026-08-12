import 'package:flutter/material.dart';

class FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterChip({
    super.key,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: selected
            ? Colors.blue
            : const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

class RatingChip extends StatelessWidget {
  final String label;
  final bool selected;

  const RatingChip({
    super.key,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: selected
            ? Colors.blue
            : const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star,
            size: 17,
            color: selected ? Colors.white : Colors.grey.shade300,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}