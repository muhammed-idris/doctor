import 'package:doctor/features/notification/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../core/constants/app_theme_extension.dart';
import '../core/constants/text_styles.dart';
import 'custom_container.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>()?? GlassTheme.light ;

    return AppBar(
      backgroundColor: glass.background,
      toolbarHeight: height * 0.06,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                children: [
                  Text("Hi,${widget.title} !", style: TextStyles.appBarTitle.copyWith(
                    color: glass.textPrimary,
                  )),
                  Gap(width * 0.015),
                ],
              ),
              Row(
                  children: [
                    Text(
                      'How Are you Today?',
                      style: TextStyles.subtitle.copyWith(
                        color: glass.hintText,
                      ),),
                  ])

            ],
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomGlassCard(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                borderRadius: 50,
                blur: 10,
                gradient: LinearGradient(colors: glass.surfaceGradient),
                borderColors: glass.borderColors,
                height: height * 0.05,
                width: height * 0.05,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context) => NotificationScreen(), ));
                    },
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      color: glass.textPrimary,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 3,
                child: CustomGlassCard(
                  borderRadius: 100,
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  backgroundColor: glass.textMuted,
                  child: SizedBox.shrink()
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}