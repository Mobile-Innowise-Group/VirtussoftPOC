library auth;

import 'package:navigation/navigation.dart';

export 'auth.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AuthScreenRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      initial: true,
      page: AuthRoute.page,
    ),
  ];
}

