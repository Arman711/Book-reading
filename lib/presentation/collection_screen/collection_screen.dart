import 'package:auto_route/auto_route.dart';
import 'package:book_reading/application/book/book_bloc/book_bloc.dart';
import 'package:book_reading/di.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/collection_screen/widgets/collection_product_card.dart';
import 'package:book_reading/presentation/core/constants/typography.dart';
import 'package:book_reading/presentation/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        top: MediaQuery.of(context).padding.top,
        prefixIcon: InkWell(
          onTap: () => context.router.maybePop(),
          child: SvgPicture.asset(
            Assets.icons.arrowLeft,
            height: 14,
            width: 14,
            fit: BoxFit.none,
          ),
        ),
        suffixIcon: Image.asset(
          Assets.images.notification.path,
        ),
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
              BlocProvider(
                create: (context) => BookBloc(di())
                  ..add(
                    const BookEvent.getBookCollection(),
                  ),
                child: BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      success: (books) => SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CollectionProductCard(
                              title: books[index].title,
                              imgUrl: books[index].imgUrl,
                              author: books[index].author,
                              description: books[index].description,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 36,
                            );
                          },
                          itemCount: books.length,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
