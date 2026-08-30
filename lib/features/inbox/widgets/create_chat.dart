import 'package:flutter/material.dart';
import 'package:doctor/core/constants/app_theme_extension.dart';
import 'package:doctor/core/constants/text_styles.dart';
import 'package:doctor/shared/custom_container.dart';

import 'chat_list.dart';

class CreateNewMessageBottomSheet extends StatefulWidget {
  const CreateNewMessageBottomSheet({
    super.key,
    this.onDoctorSelected,
  });

  final ValueChanged<DoctorChatModel>? onDoctorSelected;

  @override
  State<CreateNewMessageBottomSheet> createState() =>
      _CreateNewMessageBottomSheetState();
}

class _CreateNewMessageBottomSheetState
    extends State<CreateNewMessageBottomSheet> {
  final TextEditingController searchController = TextEditingController();

  final List<DoctorChatModel> doctors = const [
    DoctorChatModel(
      name: 'Dr. Randy Wigham',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: '',
      time: '',
      unread: 0,
       image: 'assets/images/dr_randy.png',
    ),
    DoctorChatModel(
      name: 'Dr. Jack Sullivan',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: '',
      time: '',
      unread: 0,
       image: 'assets/images/dr_randy.png',
    ),
    DoctorChatModel(
      name: 'Drg. Hanna Stanton',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: '',
      time: '',
      unread: 0,
       image: 'assets/images/dr_randy.png',
    ),
    DoctorChatModel(
      name: 'Dr. Emery Lubin',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: '',
      time: '',
      unread: 0,
       image: 'assets/images/dr_randy.png',
    ),
    DoctorChatModel(
      name: 'Dr. Emery Lubin',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: '',
      time: '',
      unread: 0,
       image: 'assets/images/dr_randy.png',
    ),
    DoctorChatModel(
      name: 'Dr. Nolan Geidt',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: '',
      time: '',
      unread: 0,
       image: 'assets/images/dr_randy.png',
    ),
    DoctorChatModel(
      name: 'Dr. Gretchen Saris',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: '',
      time: '',
      unread: 0,
       image: 'assets/images/dr_randy.png',
    ),
  ];

  List<DoctorChatModel> get filteredDoctors {
    final query = searchController.text.toLowerCase().trim();

    if (query.isEmpty) {
      return doctors;
    }

    return doctors
        .where(
          (doctor) =>
      doctor.name.toLowerCase().contains(query) ||
          doctor.specialty.toLowerCase().contains(query),
    )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(_search);
  }

  void _search() {
    setState(() {});
  }

  @override
  void dispose() {
    searchController
      ..removeListener(_search)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return SafeArea(
      child: Container(
        height: height * 0.92,
        width: width,
        decoration: BoxDecoration(
          color: glass.background,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(
                width * 0.045,
                height * 0.018,
                width * 0.045,
                height * 0.012,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      Icons.close_rounded,
                      size: 24,
                      color: glass.textPrimary,
                    ),
                  ),

                  Expanded(
                    child: Center(
                      child: Text(
                        'Create New Message',
                        style: TextStyles.body.copyWith(
                          color: glass.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Keeps title centered
                  const SizedBox(width: 24),
                ],
              ),
            ),

            // Search
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.045,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomGlassCard(
                      height: height * 0.058,
                      borderRadius: 30,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.035,
                      ),
                      backgroundColor: glass.background,
                      borderColors: glass.borderColors,
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            size: 22,
                            color: glass.hintText,
                          ),

                          SizedBox(width: width * 0.02),

                          Expanded(
                            child: TextField(
                              controller: searchController,
                              style: TextStyles.bodySmall.copyWith(
                                color: glass.textPrimary,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search Message',
                                hintStyle: TextStyles.bodySmall.copyWith(
                                  color: glass.hintText,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: width * 0.035),

                  Icon(
                    Icons.tune_rounded,
                    size: 21,
                    color: glass.textPrimary,
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.012),

            // Doctors
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.045,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: filteredDoctors.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: glass.colorIcons,
                ),
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];

                  return _DoctorSelectionTile(
                    doctor: doctor,
                    onTap: () {
                      widget.onDoctorSelected?.call(doctor);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorSelectionTile extends StatelessWidget {
  const _DoctorSelectionTile({
    required this.doctor,
    required this.onTap,
  });

  final DoctorChatModel doctor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: glass.background,
              backgroundImage: AssetImage(doctor.image),
            ),

            SizedBox(width: width * 0.03),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.bodySmall.copyWith(
                      color: glass.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    doctor.specialty,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.overline.copyWith(
                      color: glass.textPrimary,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}