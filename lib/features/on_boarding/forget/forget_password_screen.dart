import 'package:doctor/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../shared/custom_button.dart';
import '../widget/auth_form_field.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: height * 0.1,
            left: width * 0.06,
            right: width * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyles.display.copyWith(
                  color: glass.primaryBlue,
                ),
              ),

              Gap(height * 0.025),

              Text(
                'Enter your email address and we will send you a link to reset your password.',
                style: TextStyles.headline1.copyWith(
                  color: glass.hintText,
                ),
              ),

              Gap(height * 0.04),

              CustomTextField(
                hintText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const Spacer(),

              CustomButton(
                text: 'Reset Password',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OtpVerificationScreen(),));
                },
              ),

              Gap(height * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}