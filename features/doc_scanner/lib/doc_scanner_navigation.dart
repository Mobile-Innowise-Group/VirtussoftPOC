library doc_scanner;

import 'package:navigation/navigation.dart';

import 'doc_scanner_navigation.gr.dart';

export 'doc_scanner_navigation.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class DocScannerScreenRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      page: DocScannerRoute.page,
    ),
  ];
}
