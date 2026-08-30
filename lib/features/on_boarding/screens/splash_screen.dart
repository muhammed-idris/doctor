
import 'package:doctor/features/on_boarding/screens/get_started_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/storge/token_storge.dart';
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

    _openNextScreen();
  }

  Future<void> _openNextScreen() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    final hasToken = await TokenStorage.hasToken();
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => hasToken ? const Root() : const GetStartedScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Splash Screen.png',
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}