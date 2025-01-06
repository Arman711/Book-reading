import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class ContentTile extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  const ContentTile({
    super.key,
    required this.author,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.boldTexts24w6,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          author,
          style: AppTypography.s14w5cb842,
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          'The story follows a woman named Nora Seed',
          style: AppTypography.s14w4c83,
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Overview',
          style: AppTypography.s16w5c842,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: AppTypography.s14w4c83,
        ),
      ],
    );
  }
}
