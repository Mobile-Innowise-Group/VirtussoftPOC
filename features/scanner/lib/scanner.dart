library scanner;

import 'package:navigation/navigation.dart';

export 'scanner.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class ScannerScreenRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: ScannerRoute.page,
        ),
      ];
}
