import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';

class AppointmentStepper extends StatelessWidget {
  const AppointmentStepper({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  final int currentStep;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isEven) {
          final stepIndex = i ~/ 2;
          final isDone = stepIndex < currentStep;
          final isActive = stepIndex == currentStep;

          return _StepCircleLabel(
            number: stepIndex + 1,
            label: steps[stepIndex],
            isDone: isDone,
            isActive: isActive,
            glass: glass,
          );
        }

        final lineIndex = i ~/ 2;
        final isCompleted = lineIndex < currentStep;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 4, right: 4),
            child: Container(
              height: 1.5,
              color: isCompleted
                  ? glass.primaryBlue
                  : glass.hintText.withValues(alpha: 0.25),
            ),
          ),
        );
      }),
    );
  }
}

class _StepCircleLabel extends StatelessWidget {
  const _StepCircleLabel({
    required this.number,
    required this.label,
    required this.isDone,
    required this.isActive,
    required this.glass,
  });

  final int number;
  final String label;
  final bool isDone;
  final bool isActive;
  final GlassTheme glass;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    final isFilled = isDone || isActive;

    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? glass.primaryBlue : Colors.transparent,
            border: Border.all(
              color: isFilled
                  ? glass.primaryBlue
                  : glass.hintText.withValues(alpha: 0.4),
              width: 1.5,
            ),
          ),
          alignment: Alignment.center,
          child: isDone
              ? const Icon(Icons.check_rounded, size: 25, color: Colors.white)
              : Text(
            "$number",
            style: TextStyles.body.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: isFilled ? Colors.white : glass.hintText,
            ),
          ),
        ),
        const Gap(6),
        Text(
          label,
          style: TextStyles.body.copyWith(
            color: isActive ? glass.primaryBlue : glass.hintText,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}