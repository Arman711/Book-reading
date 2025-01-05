import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class SearchedText extends StatelessWidget {
  final String text;
  const SearchedText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          const Icon(
            Icons.watch_later_outlined,
            color: AppColor.c4,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: AppTypography.s14w4c30,
          ),
          const Spacer(),
          const Icon(
            Icons.cancel_outlined,
            color: AppColor.a30,
          ),
        ],
      ),
    );
  }
}
