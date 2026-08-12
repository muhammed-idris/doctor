import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'About me',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          Text(
            'Dr. Jenny Watson is the top most Immunologists '
                'specialist in Christ Hospital at London. She '
                'achieved several awards for her wonderful '
                'contribution in medical field.',
          ),

          SizedBox(height: 25),

          Text(
            'Working Time',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          Text('Monday - Friday, 08.00 AM - 20.00 PM'),
        ],
      ),
    );
  }
}