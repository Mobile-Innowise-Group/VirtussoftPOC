library user_data;

import 'package:navigation/navigation.dart';

export 'package:user_folders/src/user_folders/bloc/user_folders_bloc.dart';

export 'user_folder.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class UserFolderRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: FoldersScanListRoute.page,
        ),
      ];
}
