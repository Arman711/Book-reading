import 'package:book_reading/presentation/core/widgets/custom_appbar.dart';
import 'package:book_reading/presentation/explore_screen/widgets/content_tile.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        top: MediaQuery.of(context).padding.top,
        prefixIcon: Icons.keyboard_arrow_left,
        suffixIcon: Icons.notifications_none,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 296,
                width: 217,
                child: Image.asset('assets/images/product.png'),
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
