import 'package:auto_route/auto_route.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:book_reading/presentation/core/widgets/custom_appbar.dart';
import 'package:book_reading/presentation/home_screen/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        prefixIcon: SvgPicture.asset(
          Assets.icons.menu,
          height: 18,
          width: 18,
          fit: BoxFit.none,
        ),
        text: 'Read Ease',
        suffixIcon: SvgPicture.asset(
          Assets.icons.notification,
          height: 18,
          width: 18,
          fit: BoxFit.none,
        ),
        top: MediaQuery.of(context).viewPadding.top,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recomended for you',
                style: AppTypography.s18w6,
              ),
              const Text(
                'Handpicked based on your reading preferences.',
                style: AppTypography.s14w4c83,
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 330,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return const ProductCard(
                      typeText: 'Fiction',
                    );
                  },
                  itemCount: 4,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'New Releases',
                style: AppTypography.s18w6,
              ),
              const Text(
                'Newly released books spanning various genres.',
                style: AppTypography.s14w4c83,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 330,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return const ProductCard(
                      typeText: 'Non-Fiction',
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
