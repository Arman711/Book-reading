import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          SizedBox(
            child: SvgPicture.asset(
              Assets.icons.delete,
              height: 18,
              width: 18,
              fit: BoxFit.none,
            ),
          ),
        ],
      ),
    );
  }
}
