import 'package:auto_route/auto_route.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/widgets/custom_appbar.dart';
import 'package:book_reading/presentation/explore_screen/widgets/content_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        top: MediaQuery.of(context).padding.top,
        prefixIcon: SvgPicture.asset(
          Assets.icons.arrowLeft,
          height: 14,
          width: 14,
          fit: BoxFit.none,
        ),
        suffixIcon: SvgPicture.asset(
          Assets.icons.notification,
          height: 20,
          width: 18,
          fit: BoxFit.none,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 296,
                width: 217,
                child: Image.asset(Assets.images.product.path),
              ),
              const SizedBox(
                height: 30,
              ),
              const ContentTile(),
            ],
          ),
        ),
      ),
    );
  }
}
