library user_data;

import 'package:navigation/navigation.dart';

export 'user_categories.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class UserCategoriesRoute extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: CategorizedDocumentListRoute.page,
        ),
      ];
}
