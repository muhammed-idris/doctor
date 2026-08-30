import 'package:doctor/features/on_boarding/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/doctor_bloc/doctor_bloc.dart';
import 'bloc/specialization_bloc/specialization_bloc.dart';

import 'core/api/dio_client.dart';
import 'core/constants/app_theme_extension.dart';

import 'core/repos/auth_repo.dart';
import 'core/repos/doctor_repo.dart';
import 'core/repos/specialization_repo.dart';

void main() {
  final dioClient = DioClient();

  runApp(
    MultiBlocProvider(
      providers: [
        // ================= AUTH =================

        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: AuthRepository(
              dioClient,
            ),
          ),
        ),

        // ================= SPECIALIZATION =================

        BlocProvider(
          create: (_) => SpecializationBloc(
            SpecializationRepository(
              dioClient: dioClient,
            ),
          ),
        ),

        // ================= DOCTOR =================

        BlocProvider(
          create: (_) => DoctorBloc(
            repository: DoctorRepository(
              dioClient: dioClient,
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
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