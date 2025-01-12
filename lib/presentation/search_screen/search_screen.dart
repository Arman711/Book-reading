import 'package:auto_route/auto_route.dart';
import 'package:book_reading/application/search/add_searched_text/add_searched_text_bloc.dart';
import 'package:book_reading/application/search/searched_text_bloc/searched_text_bloc.dart';
import 'package:book_reading/di.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/auth_screen/widgets/app_text_field.dart';
import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/widgets/custom_appbar.dart';
import 'package:book_reading/presentation/search_screen/widgets/searched_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchedTextBloc(di())
        ..add(
          const SearchedTextEvent.getSearchedText(),
        ),
      child: Scaffold(
        backgroundColor: Colors.white,
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
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppTextField(
                  controller: searchController,
                  textColor: AppColor.f83,
                  suffixIcon: InkWell(
                    child: InkWell(
                      onTap: () {
                        context.read<AddSearchedTextBloc>().add(
                              AddSearchedTextEvent.addSearchedText(
                                text: searchController.text,
                              ),
                            );
                      },
                      child: BlocListener<AddSearchedTextBloc,
                          AddSearchedTextState>(
                        listener: (context, state) {
                          state.whenOrNull(
                            success: () => context.read<SearchedTextBloc>().add(
                                  const SearchedTextEvent.getSearchedText(),
                                ),
                          );
                        },
                        child: SvgPicture.asset(
                          Assets.icons.search,
                          height: 18,
                          width: 18,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<SearchedTextBloc, SearchedTextState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (searchedTexts) => SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return SearchedText(
                              text: searchedTexts[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 24,
                            );
                          },
                          itemCount: searchedTexts.length,
                        ),
                      ),
                      initial: () => Text('data'),
                      orElse: () => const SizedBox(
                        child: Text('aaa'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
