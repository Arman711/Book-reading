import 'package:auto_route/auto_route.dart';
import 'package:book_reading/application/user_bloc/user_bloc.dart';
import 'package:book_reading/gen/assets.gen.dart';
import 'package:book_reading/presentation/core/constants/colors.dart';
import 'package:book_reading/presentation/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Colors.white,
      routes: const [
        HomeRoute(),
        SearchRoute(),
        CollectionRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: () => BottomNavigationBar(
                selectedItemColor: AppColor.a853,
                unselectedItemColor: AppColor.e32,
                selectedIconTheme: const IconThemeData(color: AppColor.a853),
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.home,
                      height: 20,
                      width: 18,
                      fit: BoxFit.none,
                      colorFilter: ColorFilter.mode(
                        tabsRouter.activeIndex == 0
                            ? AppColor.a853
                            : AppColor.e32,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.search,
                      height: 18,
                      width: 18,
                      fit: BoxFit.none,
                      colorFilter: ColorFilter.mode(
                        tabsRouter.activeIndex == 1
                            ? AppColor.a853
                            : AppColor.e32,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icons.book,
                      height: 20,
                      width: 16,
                      fit: BoxFit.none,
                      colorFilter: ColorFilter.mode(
                        tabsRouter.activeIndex == 2
                            ? AppColor.a853
                            : AppColor.e32,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'My Collection',
                  ),
                ],
              ),
              orElse: () => Text('data'),
            );
          },
        );
      },
    );
  }
}
