import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:flutter/material.dart';

class CollectionProductCard extends StatelessWidget {
  const CollectionProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 78,
            child: Image.asset(
              Assets.images.product.path,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        const Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'The Midnight Library',
                    style: AppTypography.s14w6c842,
                  ),
                  Icon(
                    Icons.save,
                    color: AppColor.a853,
                  ),
                ],
              ),
              Text(
                'Matt Haig',
                style: AppTypography.s14w5cb842,
              ),
              Text(
                'The story follows a woman named Nora Seed.',
                style: AppTypography.s14w4c83,
              )
            ],
          ),
        )
      ],
    );
  }
}
