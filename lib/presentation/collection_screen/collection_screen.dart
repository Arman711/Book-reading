import 'package:auto_route/auto_route.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/collection_screen/widgets/collection_product_card.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:book_reading/presentation/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        top: MediaQuery.of(context).padding.top,
        prefixIcon: SvgPicture.asset(
          Assets.icons.arrowLeft,
          height: 14,
          width: 14,
          fit: BoxFit.none,
        ),
        suffixIcon: Image.asset(
          Assets.images.notification.path,
        ),
        // suffixIcon: SvgPicture.asset(
        //   Assets.icons.notification,
        //   height: 20,
        //   width: 18,
        //   fit: BoxFit.none,
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Collections',
                style: AppTypography.s18w6,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const CollectionProductCard();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 36,
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
