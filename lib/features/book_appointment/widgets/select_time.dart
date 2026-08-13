import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';

class TimeSlotSelector extends StatelessWidget {
  const TimeSlotSelector({
    super.key,
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final List<String> times;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available time",
          style: TextStyles.headline1.copyWith(
            color: glass.textPrimary,
          ),
        ),
        const Gap(12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: times.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.9,
          ),
          itemBuilder: (context, index) {
            final time = times[index];
            final isSelected = time == selectedTime;

            return _TimeSlotCard(
              time: time,
              isSelected: isSelected,
              onTap: () => onTimeSelected(time),
              glass: glass,
            );
          },
        ),
      ],
    );
  }
}

class _TimeSlotCard extends StatelessWidget {
  const _TimeSlotCard({
    required this.time,
    required this.isSelected,
    required this.onTap,
    required this.glass,
  });

  final String time;
  final bool isSelected;
  final VoidCallback onTap;
  final GlassTheme glass;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? glass.primaryBlue
              : glass.hintText.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          time,
          style: TextStyles.headline2.copyWith(
            color: isSelected ? Colors.white : glass.hintText,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}