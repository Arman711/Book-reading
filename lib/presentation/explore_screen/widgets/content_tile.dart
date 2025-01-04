import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I want a Better Catastrophe',
          style: AppTypography.boldTexts24w6,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Andrew Boyd',
          style: AppTypography.s14w5cb842,
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'The story follows a woman named Nora Seed',
          style: AppTypography.s14w4c83,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Overview',
          style: AppTypography.s16w5c842,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'He searches out eight leading climate thinkers from collapse-psychologist Jamey Hecht to grassroots strategist adrienne maree brown, eco-philosopher Joanna Macy, and Indigenous botanist Robin Wall Kimmerer ― asking them: "Is it really the end of the world? and if so, now what?',
          style: AppTypography.s14w4c83,
        ),
        Text(
          'With gallows humor and a broken heart, Boyd steers readers through their climate angst as he walks his own. From storm-battered coastlines to pipeline blockades and "hopelessness workshops," he maps out our existential options, and tackles some familiar dilemmas: ',
          style: AppTypography.s14w4c83,
        ),
      ],
    );
  }
}
