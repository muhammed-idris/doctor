import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../data/models/doctor_model/review_model.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  static const List<ReviewModel> _dummyReviews = [
    ReviewModel(
      avatarAsset: "assets/images/dr_randy.png",
      name: "Jane Cooper",
      date: "Today",
      rating: 5,
      reviewText:
          "As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.",
    ),
    ReviewModel(
      avatarAsset: "assets/images/dr_randy.png",
      name: "Robert Fox",
      date: "2 days ago",
      rating: 4,
      reviewText:
          "Great experience overall, the doctor was attentive and the app is easy to use. Booking could be a bit faster though.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),

      itemCount: _dummyReviews.length,

      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),

          child: Divider(height: 1, color: Color(0xFFF0F0F0)),
        );
      },

      itemBuilder: (context, index) {
        return ReviewCard(review: _dummyReviews[index]);
      },
    );
  }
}

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CircleAvatar(
              radius: 22,

              backgroundImage: AssetImage(review.avatarAsset),
            ),

            Gap(width * 0.03),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    review.name,

                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ).copyWith(color: glass.textPrimary),
                  ),

                  const Gap(6),

                  _RatingStars(rating: review.rating),
                ],
              ),
            ),

            Text(
              review.date,

              style: TextStyles.body.copyWith(color: glass.hintText),
            ),
          ],
        ),

        const Gap(10),

        Text(
          review.reviewText,

          style: TextStyles.body.copyWith(color: glass.hintText, height: 1.5),
        ),
      ],
    );
  }
}

class _RatingStars extends StatelessWidget {
  final int rating;

  const _RatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star_rounded : Icons.star_border_rounded,

          size: 18,

          color: const Color(0xFFFFD600),
        );
      }),
    );
  }
}
