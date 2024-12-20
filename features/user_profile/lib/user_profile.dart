library user_profile;

import 'package:navigation/navigation.dart';

export 'user_profile.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class UserProfileScreenRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: UserProfileRoute.page,
        ),
      ];
}
