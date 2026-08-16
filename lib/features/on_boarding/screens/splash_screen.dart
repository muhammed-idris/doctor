
import 'package:doctor/features/on_boarding/screens/get_started_screen.dart';
import 'package:flutter/material.dart';

import '../../../root/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const GetStartedScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Splash Screen.png',
          width: width * 1 ,
          height: height * 1,
          fit: BoxFit.cover,


        ),
      ),
    );
  }
}