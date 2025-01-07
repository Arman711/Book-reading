import 'package:auto_route/auto_route.dart';
import 'package:book_reading/presentation/auth_screen/auth_screen.dart';
import 'package:book_reading/presentation/collection_screen/collection_screen.dart';
import 'package:book_reading/presentation/explore_screen/explore_screen.dart';
import 'package:book_reading/presentation/general_screen/general_screen1.dart';
import 'package:book_reading/presentation/home_screen/home_screen.dart';
import 'package:book_reading/presentation/search_screen/search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          initial: true,
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/collection',
          page: CollectionRoute.page,
        ),
        AutoRoute(
          path: '/explore',
          page: ExploreRoute.page,
        ),
        AutoRoute(
          path: '/search',
          page: SearchRoute.page,
        ),
        AutoRoute(
          path: '/general',
          page: GeneralRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: SearchRoute.page),
            AutoRoute(page: CollectionRoute.page),
          ],
        ),
      ];
}
