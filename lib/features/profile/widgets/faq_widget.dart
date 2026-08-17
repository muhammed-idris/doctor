import 'package:doctor/core/constants/app_theme_extension.dart';
import 'package:doctor/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class FaqWidget extends StatefulWidget {
  final String question;
  final String answer;
  final bool initiallyExpanded;

  const FaqWidget({
    super.key,
    required this.question,
    required this.answer,
    this.initiallyExpanded = false,
  });

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.018,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: glass.hintText.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.question,
                    style: TextStyles.headline2.copyWith(
                      color: glass.textPrimary,
                    ),
                  ),
                ),

                SizedBox(width: width * 0.03),

                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: width * 0.05,
                  color: glass.textPrimary,
                ),
              ],
            ),

            if (isExpanded) ...[
              SizedBox(height: height * 0.015),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.answer,
                  style: TextStyles.headline2.copyWith(
                    color: glass.hintText,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}