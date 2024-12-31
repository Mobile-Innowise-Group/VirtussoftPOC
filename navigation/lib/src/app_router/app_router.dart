import '../../navigation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        ...AuthScreenRouter().routes,
        ...HomeScreenRouter().routes,
        ...ScannerScreenRouter().routes,
        ...UserFolderRouter().routes,
      ];
}
