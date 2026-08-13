import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
    this.onSetManual,
    this.visibleCount = 5,
  });

  final List<DateTime> dates;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback? onSetManual;
  final int visibleCount;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  int startIndex = 0;

  bool get canGoBack => startIndex > 0;

  bool get canGoForward =>
      startIndex + widget.visibleCount < widget.dates.length;

  void _shift(int delta) {
    setState(() {
      startIndex = (startIndex + delta).clamp(
        0,
        (widget.dates.length - widget.visibleCount).clamp(0, widget.dates.length),
      );
    });
  }

  bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;
    final visibleDates = widget.dates.skip(startIndex).take(widget.visibleCount).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Select Date",
              style: TextStyles.headline1.copyWith(
                color: glass.textPrimary,
              ),
            ),
            GestureDetector(
              onTap: widget.onSetManual,
              child: Text(
                "Set Manual",
                style: TextStyles.body.copyWith(
                  color: glass.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          children: [
            _ChevronButton(
              icon: Icons.chevron_left_rounded,
              enabled: canGoBack,
              onTap: () => _shift(-1),
              glass: glass,
            ),
            const Gap(4),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: visibleDates.map((date) {
                  final isSelected = isSameDay(date, widget.selectedDate);
                  return _DateCard(
                    date: date,
                    isSelected: isSelected,
                    onTap: () => widget.onDateSelected(date),
                    glass: glass,
                  );
                }).toList(),
              ),
            ),
            const Gap(4),
            _ChevronButton(
              icon: Icons.chevron_right_rounded,
              enabled: canGoForward,
              onTap: () => _shift(1),
              glass: glass,
            ),
          ],
        ),
      ],
    );
  }
}

class _DateCard extends StatelessWidget {
  const _DateCard({
    required this.date,
    required this.isSelected,
    required this.onTap,
    required this.glass,
  });

  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;
  final GlassTheme glass;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 44,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? glass.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat('E').format(date),
              style: TextStyles.bodySmall.copyWith(
                color: isSelected ? Colors.white : glass.hintText,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(4),
            Text(
              DateFormat('dd').format(date),
              style: TextStyles.body.copyWith(
                color: isSelected ? Colors.white : glass.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChevronButton extends StatelessWidget {
  const _ChevronButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
    required this.glass,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;
  final GlassTheme glass;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Icon(
        icon,
        size: 22,
        color: enabled ? glass.textPrimary : glass.hintText.withValues(alpha: 0.3),
      ),
    );
  }
}