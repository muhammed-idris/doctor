import 'package:doctor/core/constants/text_styles.dart';
import 'package:doctor/features/on_boarding/forget/forget_password_screen.dart';
import 'package:doctor/features/on_boarding/screens/sign_up_screen.dart';
import 'package:doctor/root/root.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../shared/custom_button.dart';
import '../widget/auth_form_field.dart';
import '../widget/or_divider.dart';
import '../widget/social_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

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
              Text("Welcome Back",
                style: TextStyles.display.copyWith(
                    color: glass.primaryBlue
                ),
              ),
              Gap(height * 0.01),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.headline1.copyWith(
                    color: glass.hintText
                ),
              ),
              Gap(height * 0.04),
              Column(
                children: [

                  CustomTextField(
                    hintText: 'Email',
                    controller: emailController,
                  ),

                  SizedBox(height: height * 0.02),

                  CustomTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  Gap(height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                            height: height * 0.035,
                            child: Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                              activeColor: glass.primaryBlue,
                              side: BorderSide(
                                color: glass.borderFieldColor,
                                width: width * 0.005,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width * 0.01),
                              ),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),

                          SizedBox(width: width * 0.02),

                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: width * 0.032,
                              color: glass.hintText,
                            ),
                          ),
                        ],
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen(),) );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: width * 0.032,
                            color: glass.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(height * 0.03),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {},
                  ),
                  Gap(height * 0.06),
                  const OrDivider(),
                  Gap(height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialLoginButton(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/Group 427323113.png',
                          width: width * 0.07,
                          height: height * 0.07,
                        ),
                      ),
                      SocialLoginButton(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/XMLID_22_.png',
                          width: width * 0.06,
                        ),
                      ),
                      SocialLoginButton(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icons/Logo.png',
                          width: width * 0.06,
                        ),
                      ),
                    ],
                  ),
                  Gap(height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By continuing, you agree to our ',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          color: glass.hintText,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          // Terms & Conditions
                        },
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600,
                            color: glass.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: glass.hintText,
                        ),
                      ),

                      SizedBox(width: width * 0.015),

                      GestureDetector(
                        onTap: () {
                         Navigator.pushReplacement(context,MaterialPageRoute(
                             builder: (context) => SignUpScreen(), ));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w600,
                            color: glass.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
