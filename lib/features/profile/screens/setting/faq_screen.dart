import 'package:doctor/shared/back_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/faq_widget.dart';
import '../../widgets/setting_widget.dart';
import 'notification_setting_screen.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BackAppBar(appBarTitle: "Setting"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          children: [
            FaqWidget(
              question: "What should I expect during a doctor's appointment?",
              answer:
                  "During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
              initiallyExpanded: true,
            ),

            FaqWidget(
              question: "What should I bring to my doctor's appointment?",
              answer:
                  "Bring your ID, medical records, current medications, and any relevant test results.",
            ),

            FaqWidget(
              question:
                  "What if I need to cancel or reschedule my appointment?",
              answer:
                  "You can cancel or reschedule your appointment through the app or by contacting the clinic.",
            ),

            FaqWidget(
              question: "How do I make an appointment with a doctor?",
              answer:
                  "Search for a doctor, select an available time, and confirm your appointment.",
            ),

            FaqWidget(
              question:
                  "How early should I arrive for my doctor's appointment?",
              answer:
                  "It is recommended to arrive around 10 to 15 minutes before your appointment.",
            ),

            FaqWidget(
              question: "How long will my doctor's appointment take?",
              answer:
                  "Most appointments take around 15 to 30 minutes, depending on your needs.",
            ),

            FaqWidget(
              question: "How much will my doctor's appointment cost?",
              answer:
                  "The cost depends on the doctor, specialty, and type of consultation.",
            ),

            FaqWidget(
              question: "What should I look for in a good doctor?",
              answer:
                  "Look for a qualified doctor with good communication, experience, and positive patient feedback.",
            ),
          ],
        ),
      ),
    );
  }
}
