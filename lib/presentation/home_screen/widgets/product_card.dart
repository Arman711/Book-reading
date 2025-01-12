import 'package:auto_route/auto_route.dart';
import 'package:book_reading/application/book/cubit/get_book_cubit.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:book_reading/presentation/core/router/router.dart';
import 'package:book_reading/presentation/home_screen/widgets/type_of_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final String typeText;
  final String imgUrl;
  final String title;
  final String id;
  const ProductCard({
    super.key,
    required this.typeText,
    required this.imgUrl,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<GetBookCubit>().getBook(id);
        context.router.push(const ExploreRoute());
      },
      child: SizedBox(
        width: 180,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    SizedBox(
                      height: 250,
                      width: 180,
                      child: imgUrl.contains('assets')
                          ? Image.asset(Assets.images.product.path)
                          : Image.network(
                              imgUrl,
                              fit: BoxFit.cover,
                            ),
                    ),
                    TypeOfBook(
                      text: typeText,
                    ),
                  ],
                ),
              ),
              Text(
                title,
                style: AppTypography.s14w5cb842,
              ),
              const Text(
                'With global warming projected to rocket past the...',
                style: AppTypography.s14w4c83,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
