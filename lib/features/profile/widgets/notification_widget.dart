import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';

class NotificationSettingWidget extends StatefulWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const NotificationSettingWidget({
    super.key,
    required this.title,
    this.value = false,
    this.onChanged,
  });

  @override
  State<NotificationSettingWidget> createState() =>
      _NotificationSettingWidgetState();
}

class _NotificationSettingWidgetState
    extends State<NotificationSettingWidget> {
  late bool isEnabled;

  @override
  void initState() {
    super.initState();
    isEnabled = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.014,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: glass.hintText.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: TextStyles.body.copyWith(
                color: glass.textPrimary,
              ),
            ),
          ),

          Switch(
            value: isEnabled,
            onChanged: (value) {
              setState(() {
                isEnabled = value;
              });

              widget.onChanged?.call(value);
            },
            activeThumbColor: Colors.white,
            activeTrackColor: glass.primaryBlue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}