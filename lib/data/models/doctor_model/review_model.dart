class ReviewModel {
  final String avatarAsset;
  final String name;
  final String date;
  final int rating;
  final String reviewText;

  const ReviewModel({
    required this.avatarAsset,
    required this.name,
    required this.date,
    required this.rating,
    required this.reviewText,
  });
}