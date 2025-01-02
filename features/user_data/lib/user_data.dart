library user_data;

import 'package:navigation/navigation.dart';

export 'user_data.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class UserDataRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          maintainState: false,
          page: UserDataRoute.page,
        ),
      ];
}
