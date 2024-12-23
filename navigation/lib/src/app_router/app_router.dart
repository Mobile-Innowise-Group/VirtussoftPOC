import 'package:doc_scanner/doc_scanner_navigation.dart';

import '../../navigation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: DemoHomeRoute.page,
        ),
        AutoRoute(
          page: DocScannerRoute.page,
        ),
      ];
}
