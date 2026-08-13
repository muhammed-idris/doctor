import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/custom_container.dart';


/// Machine-readable appointment type keys, exposed so other screens
/// (e.g. the booking summary) can map a key back to a display label.
class AppointmentTypeKeys {
  static const inPerson = 'in_person';
  static const videoCall = 'video_call';
  static const phoneCall = 'phone_call';

  static const Map<String, String> labels = {
    inPerson: 'In Person',
    videoCall: 'Video Call',
    phoneCall: 'Phone Call',
  };

  static String labelFor(String key) => labels[key] ?? key;
}

class AppointmentTypeWidget extends StatefulWidget {
  const AppointmentTypeWidget({
    super.key,
    this.initialType,
    this.onChanged,
  });

  /// The currently selected type key (see [AppointmentTypeKeys]).
  final String? initialType;

  /// Called with the new type key whenever the user picks a type.
  final ValueChanged<String>? onChanged;

  @override
  State<AppointmentTypeWidget> createState() =>
      _AppointmentTypeWidgetState();
}

class _AppointmentTypeWidgetState extends State<AppointmentTypeWidget> {
  late String selectedType = widget.initialType ?? AppointmentTypeKeys.inPerson;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    final types = [
      (
      title: 'In Person',
      icon: Icons.people_outline,
      color: Colors.blue,
      type: AppointmentTypeKeys.inPerson,
      ),
      (
      title: 'Video Call',
      icon: Icons.videocam_outlined,
      color: Colors.green,
      type: AppointmentTypeKeys.videoCall,
      ),
      (
      title: 'Phone Call',
      icon: Icons.phone_outlined,
      color: Colors.red,
      type: AppointmentTypeKeys.phoneCall,
      ),
    ];

    final selectedIndex = types.indexWhere((t) => t.type == selectedType);

    return CustomGlassCard(
      width: width,
      padding:EdgeInsets.zero,
      borderRadius: 20,
      blur: 20,
      borderWidth: 1,
      borderColors: glass.borderColors,
      backgroundColor: glass.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Appointment Type',
            style: TextStyles.headline1.copyWith(
              color: glass.textPrimary,
            ),
          ),

          SizedBox(height: height * 0.008),

          ...List.generate(types.length, (index) {
            final type = types[index];

            return InkWell(
              onTap: () {
                setState(() => selectedType = type.type);
                widget.onChanged?.call(selectedType);
              },
              child: Container(
                height: height * 0.075,
                decoration: index == types.length - 1
                    ? null
                    : BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: glass.hintText,
                      width: 0.6,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    // Icon
                    Container(
                      width: width * 0.075,
                      height: width * 0.075,
                      decoration: BoxDecoration(
                        color: type.color.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        type.icon,
                        size: width * 0.045,
                        color: type.color,
                      ),
                    ),

                    SizedBox(width: width * 0.03),

                    // Title
                    Expanded(
                      child: Text(
                        type.title,
                        style: TextStyles.bodySmall.copyWith(
                          color: glass.textPrimary,
                        ),
                      ),
                    ),

                    // Radio
                    SizedBox(
                      width: width * 0.06,
                      height: width * 0.06,
                      child: Radio<int>(
                        value: index,
                        groupValue: selectedIndex,
                        onChanged: (value) {
                          setState(() => selectedType = types[value!].type);
                          widget.onChanged?.call(selectedType);
                        },
                        activeColor: glass.primaryBlue,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}