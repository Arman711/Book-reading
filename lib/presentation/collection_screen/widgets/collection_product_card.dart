import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollectionProductCard extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String author;
  final String description;
  const CollectionProductCard({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.author,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 78,
            child: Image.network(imgUrl),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTypography.s14w6c842,
                    ),
                  ),
                  SvgPicture.asset(Assets.icons.save),
                ],
              ),
              Text(
                author,
                style: AppTypography.s14w5cb842,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: Text(
                        description,
                        style: AppTypography.s14w4c83,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
