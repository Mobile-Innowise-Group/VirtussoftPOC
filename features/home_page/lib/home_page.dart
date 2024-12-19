library home_page;

import 'package:navigation/navigation.dart';

export 'home_page.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class HomeScreenRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      page: HomeRoute.page,
      children: <AutoRoute>[
        ...UserProfileScreenRouter().routes,
        ...UserCategoriesScreenRouter().routes,
        ...ScannerScreenRouter().routes,
      ],
    ),
  ];
}
