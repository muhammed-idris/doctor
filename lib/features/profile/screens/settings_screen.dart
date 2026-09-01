import 'package:doctor/features/profile/screens/setting/faq_screen.dart';
import 'package:doctor/features/profile/screens/setting/security_screen.dart';
import 'package:doctor/shared/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../bloc/auth_bloc/auth_event.dart';
import '../../../bloc/auth_bloc/auth_state.dart';
import '../../on_boarding/screens/sign_in_screen.dart';
import '../widgets/logout_dialog.dart';
import '../widgets/setting_widget.dart';
import 'setting/notification_setting_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Logout successful
        if (state is AuthLoggedOut) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const SignInScreen()),
            (route) => false,
          );
        }

        // Logout failed
        if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: BackAppBar(appBarTitle: "Setting"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            children: [
              ProfileSettingWidget(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black87,
                  size: width * 0.045,
                ),
                iconBackgroundColor: Colors.transparent,
                title: "Notification",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationSettingsScreen(),
                    ),
                  );
                },
              ),

              ProfileSettingWidget(
                icon: Icon(
                  Icons.help_outline,
                  color: Colors.black87,
                  size: width * 0.045,
                ),
                iconBackgroundColor: Colors.transparent,
                title: "FAQ",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FaqScreen()),
                  );
                },
              ),

              ProfileSettingWidget(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.black87,
                  size: width * 0.045,
                ),
                iconBackgroundColor: Colors.transparent,
                title: "Security",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecurityScreen(),
                    ),
                  );
                },
              ),

              ProfileSettingWidget(
                icon: Icon(
                  Icons.translate_outlined,
                  color: Colors.black87,
                  size: width * 0.045,
                ),
                iconBackgroundColor: Colors.transparent,
                title: "Language",
                onTap: () {},
              ),

              ProfileSettingWidget(
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: width * 0.045,
                ),
                iconBackgroundColor: Colors.transparent,
                title: "Logout",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return LogoutDialog(
                        onCancel: () {
                          Navigator.pop(dialogContext);
                        },
                        onLogout: () {
                          Navigator.pop(dialogContext);

                          context.read<AuthBloc>().add(LogoutRequested());
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
