import 'package:doctor/features/on_boarding/screens/sign_in_screen.dart';
import 'package:doctor/root/root.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEAF2FF),
              Colors.white,
            ],
            stops: [0.0, 0.6],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background
              Positioned(
                top: height * 0.18,
                left: width * 0.13,
                child: Image.asset(
                  'assets/images/Group (1).png',
                  width: width * 0.75,
                ),
              ),

              // Logo
              Positioned(
                top: height * 0.04,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/Frame 1000005357.png',
                    width: width * 0.38,
                  ),
                ),
              ),

              // Doctor with fade mask blending edges into background
              Positioned(
                top: height * 0.17,
                left: 0,
                right: 0,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        Colors.white,
                        Colors.white,
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.08, 0.92, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.85, 1.0],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'assets/images/Image1.png',
                      width: width,
                      height: height * 0.52,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Text
              Positioned(
                left: width * 0.05,
                right: width * 0.05,
                bottom: height * 0.17,
                child: Image.asset(
                  'assets/images/Text.png',
                  width: width * 0.9,
                  fit: BoxFit.contain,
                ),
              ),

              // Button
              Positioned(
                left: width * 0.085,
                right: width * 0.085,
                bottom: height * 0.035,
                child: SizedBox(
                  height: height * 0.065,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignInScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF287DF5),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}