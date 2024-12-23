library user_tags;

import 'package:navigation/navigation.dart';

export 'user_folders.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class UserFoldersRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: UserFoldersRoute.page,
        ),
      ];
}
