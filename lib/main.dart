import 'package:doctor/features/on_boarding/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/specialization_bloc/specialization_bloc.dart';
import 'core/constants/app_theme_extension.dart';
import 'data/models/auth_model/auth_repo.dart';
import 'data/models/specialization_model/specialization_repo.dart';

void main() {
  final dio = Dio();

  final authRepository = AuthRepository(dio);

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(authRepository),
          ),

          BlocProvider(
            create: (_) => SpecializationBloc(
              SpecializationRepository(dio),
            ),
          ),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor',
      theme: ThemeData(
        scaffoldBackgroundColor: glass.background,
      ),
      home: SplashScreen(),
    );
  }
}