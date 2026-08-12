import 'package:doctor/features/home/screens/home_screen.dart';
import 'package:doctor/root/root.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_theme_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: glass.background ,
      ),
      title: 'Flutter Demo',
      home:Root(),
    );
  }
}


