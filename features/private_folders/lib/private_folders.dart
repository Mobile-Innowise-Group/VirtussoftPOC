library private_folders;

import 'package:navigation/navigation.dart';

export 'private_folders.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class PrivateFoldersRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          maintainState: false,
          page: PrivateFoldersRoute.page,
        ),
      ];
}
