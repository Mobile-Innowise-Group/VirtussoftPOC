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
          initial: true,
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
      ];
}
