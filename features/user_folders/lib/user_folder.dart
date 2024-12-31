library user_data;

import 'package:navigation/navigation.dart';

// export 'src/user_folders/bloc/user_categories_bloc.dart';
// export 'src/user_folders/user_categories.dart';
// export 'src/user_folders/widgets/create_category_dialog.dart';

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
