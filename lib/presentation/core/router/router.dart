import 'package:auto_route/auto_route.dart';
import 'package:book_reading/presentation/general_screen/general_screen.dart';
import 'package:book_reading/presentation/home_screen/home_screen.dart';
import 'package:book_reading/presentation/sign_up_screen/sign_up_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          initial: true,
          page: SignUpRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/general',
          page: GeneralRoute.page,
        ),
      ];
}
