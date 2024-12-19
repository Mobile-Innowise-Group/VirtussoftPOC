import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const <PageRouteInfo>[
        ScannerRoute(),
        UserCategoriesRoute(),
        UserProfileRoute(),
      ],
      builder: (BuildContext context, Widget child, TabController controller) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
              ),
            ],
            onTap: tabsRouter.setActiveIndex,
           // selectedIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}
