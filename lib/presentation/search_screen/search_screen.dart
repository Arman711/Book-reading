import 'package:auto_route/auto_route.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/auth_screen/widgets/app_text_field.dart';
import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/widgets/custom_appbar.dart';
import 'package:book_reading/presentation/search_screen/widgets/searched_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        //   height: 18,
        //   width: 18,
        //   fit: BoxFit.none,
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextField(
                textColor: AppColor.f83,
                suffixIcon: SvgPicture.asset(
                  Assets.icons.search,
                  height: 18,
                  width: 18,
                  fit: BoxFit.none,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 600,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const SearchedText(text: 'The Midnight Library');
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 24,
                    );
                  },
                  itemCount: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
