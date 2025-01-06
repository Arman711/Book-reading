import 'package:auto_route/auto_route.dart';
import 'package:book_reading/application/cubit/get_book_cubit.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/widgets/custom_appbar.dart';
import 'package:book_reading/presentation/explore_screen/widgets/content_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          top: MediaQuery.of(context).padding.top,
          prefixIcon: SvgPicture.asset(
            Assets.icons.arrowLeft,
            height: 18,
            width: 18,
            fit: BoxFit.none,
          ),
          suffixIcon: Image.asset(
            Assets.images.notification.path,
            fit: BoxFit.cover,
          ),
          // suffixIcon: SvgPicture.asset(
          //   Assets.icons.notification,
          //   height: 24,
          //   width: 22,
          //   fit: BoxFit.none,
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: BlocBuilder<GetBookCubit, GetBookState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  failure: (message) => Center(
                    child: Text(message),
                  ),
                  success: (book) => Column(
                    children: [
                      SizedBox(
                        height: 296,
                        width: 217,
                        child: book.imgUrl.contains('assets')
                            ? Image.asset(Assets.images.product.path)
                            : Image.network(
                                book.imgUrl,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ContentTile(
                        title: book.title,
                        author: book.author,
                        description: book.description,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
