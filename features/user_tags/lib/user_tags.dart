library user_tags;

import 'package:navigation/navigation.dart';

export 'user_tags.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class UserTagsRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      page: UserTagsRoute.page,
    ),
  ];
}
