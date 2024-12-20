library auth;

import 'package:navigation/navigation.dart';

export 'auth_navigation.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AuthScreenRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: DemoHomeRoute.page,
        ),
      ];
}
