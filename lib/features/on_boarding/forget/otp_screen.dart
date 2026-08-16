import 'package:doctor/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../shared/custom_button.dart';
import 'otp_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> controllers = List.generate(
    4,
        (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(
    4,
        (_) => FocusNode(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final node in focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.065,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(height * 0.08),

                Text(
                  'OTP Verification',
                  style: TextStyles.display.copyWith(
                    color: glass.primaryBlue,
                  ),
                ),

                Gap(height * 0.02),

                Text(
                  'Add a PIN number to make your account\n'
                      'more secure and easy to sign in.',
                  style: TextStyles.headline1.copyWith(
                    color: glass.hintText,
                  ),
                ),

                Gap(height * 0.08),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                        (index) => OtpField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          focusNodes[index + 1].requestFocus();
                        }

                        if (value.isEmpty && index > 0) {
                          focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),

                const Spacer(),

                CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    final otp = controllers
                        .map((controller) => controller.text)
                        .join();

                  },
                ),

                Gap(height * 0.06),
              ],
            ),
          ),
        ),
      ),
    );
  }
}