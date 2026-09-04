import 'package:doctor/core/constants/text_styles.dart';
import 'package:doctor/features/on_boarding/forget/forget_password_screen.dart';
import 'package:doctor/features/on_boarding/screens/sign_in_screen.dart';
import 'package:doctor/root/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../bloc/auth_bloc/auth_event.dart';
import '../../../bloc/auth_bloc/auth_state.dart';
import '../../../core/constants/app_theme_extension.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_snack_bar.dart';
import '../widget/auth_form_field.dart';
import '../widget/or_divider.dart';
import '../widget/social_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    numberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final number = numberController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (number.isEmpty) {
      AppSnackbar.showError(context, 'Enter your phone number');
      return;
    }
    if (email.isEmpty || !email.contains('@')) {
      AppSnackbar.showError(context, 'Enter a valid email address');
      return;
    }
    if (password.length < 6) {
      AppSnackbar.showError(context, 'Password must be at least 6 characters');
      return;
    }

    context.read<AuthBloc>().add(
          RegisterRequested(
            number: number,
            email: email,
            password: password,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          AppSnackbar.showSuccess(context, 'Account created successfully');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Root(),
            ),
          );
        }

        if (state is AuthFailure) {
          AppSnackbar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                top: height * 0.1,
                left: width * 0.06,
                right: width * 0.06,
                bottom: height * 0.01,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyles.display.copyWith(
                        color: glass.primaryBlue,
                      ),
                    ),
                    Gap(height * 0.01),
                    Text(
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                      style: TextStyles.headline1.copyWith(
                        color: glass.hintText,
                      ),
                    ),
                    Gap(height * 0.04),
                    Column(
                      children: [
                        CustomTextField(
                          hintText: 'Number',
                          controller: numberController,
                        ),
                        SizedBox(height: height * 0.02),
                        CustomTextField(
                          hintText: 'Email',
                          controller: emailController,
                        ),
                        SizedBox(height: height * 0.02),
                        CustomTextField(
                          hintText: 'Password',
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: glass.hintText,
                              size: width * 0.05,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ForgetPasswordScreen(),
                                  ),
                                );
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
                          text: state is AuthLoading ? 'Creating account...' : 'Sign Up',
                          onPressed: state is AuthLoading ? null : _submit,
                        ),
                        Gap(height * 0.04),
                        const OrDivider(),
                        Gap(height * 0.04),
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
                        Gap(height * 0.04),
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
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: width * 0.035,
                                color: glass.hintText,
                              ),
                            ),
                            SizedBox(width: width * 0.015),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign In',
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}