library user_categories;

import 'package:navigation/navigation.dart';

export 'user_categories.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class UserCategoriesScreenRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      initial: true,
      page: UserCategoriesRoute.page,
    ),
  ];
}
