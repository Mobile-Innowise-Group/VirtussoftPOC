library charts;

import 'package:navigation/navigation.dart';

export 'charts.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class ChartsRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: ChartsRoute.page,
        ),
      ];
}
