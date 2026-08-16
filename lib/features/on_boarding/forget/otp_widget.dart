import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';


class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const OtpField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged});



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return SizedBox(
      width: width * 0.20,
      height: height * 0.10,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: width * 0.06,
          fontWeight: FontWeight.w600,
          color: glass.textPrimary,
        ),
        decoration: InputDecoration(
          counterText: '',
          hintText: '—',
          hintStyle: TextStyle(
            color: glass.borderFieldColor,
            fontSize: width * 0.06,
          ),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.04),
            borderSide: BorderSide(
              color: glass.borderFieldColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.04),
            borderSide: BorderSide(
              color: glass.primaryBlue,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}