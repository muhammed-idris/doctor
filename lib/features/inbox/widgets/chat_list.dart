import 'package:flutter/material.dart';

class DoctorChatList extends StatelessWidget {
  const DoctorChatList({super.key});

  static const doctors = [
    DoctorChatModel(
      name: 'Dr. Randy Wigham',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: "Fine, I'll do a check. Does the\npatient have a history of certain\ndiseases?",
      time: '7:11 PM',
      unread: 2,
      image: 'assets/images/doctor_1.png',
    ),
    DoctorChatModel(
      name: 'Dr. Jack Sullivan',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: "Fine, I'll do a check. Does the\npatient have a history of certain\ndiseases?",
      time: '7:11 PM',
      unread: 2,
      image: 'assets/images/doctor_2.png',
    ),
    DoctorChatModel(
      name: 'Drg. Hanna Stanton',
      specialty: 'General Doctor | RSUD Gatot Subroto',
      message: "Fine, I'll do a check. Does the\npatient have a history of certain\ndiseases?",
      time: '7:11 PM',
      unread: 2,
      image: 'assets/images/doctor_3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: doctors.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        indent: 62,
        color: Color(0xFFEAEAEA),
      ),
      itemBuilder: (context, index) {
        final doctor = doctors[index];

        return DoctorChatTile(
          doctor: doctor,
          onTap: () {
            // Open chat
          },
        );
      },
    );
  }
}

class DoctorChatTile extends StatelessWidget {
  const DoctorChatTile({
    super.key,
    required this.doctor,
    this.onTap,
  });

  final DoctorChatModel doctor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor image
            CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xFFE8E8E8),
              backgroundImage: AssetImage(doctor.image),
            ),

            const SizedBox(width: 10),

            // Chat information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          doctor.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF292929),
                          ),
                        ),
                      ),

                      Text(
                        doctor.time,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Color(0xFF888888),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 2),

                  Text(
                    doctor.specialty,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF888888),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          doctor.message,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            height: 1.45,
                            color: Color(0xFF777777),
                          ),
                        ),
                      ),

                      if (doctor.unread > 0)
                        Container(
                          margin: const EdgeInsets.only(
                            left: 8,
                            bottom: 2,
                          ),
                          width: 17,
                          height: 17,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF287FF0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            '${doctor.unread}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
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

class DoctorChatModel {
  final String name;
  final String specialty;
  final String message;
  final String time;
  final int unread;
  final String image;


  const DoctorChatModel({
    required this.name,
    required this.specialty,
    required this.message,
    required this.time,
    required this.unread,
    required this.image,
  });
}