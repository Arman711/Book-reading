import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:book_reading/presentation/home_screen/widgets/type_of_book.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String typeText;
  const ProductCard({
    super.key,
    required this.typeText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            width: 180,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image.asset(Assets.images.product.path),
                TypeOfBook(
                  text: typeText,
                ),
              ],
            ),
          ),
          const Text(
            'I Want a Better Catastrophe',
            style: AppTypography.s14w5cb842,
          ),
          const Text(
            'With global warming projected to rocket past the...',
            style: AppTypography.s14w4c83,
          )
        ],
      ),
    );
  }
}
