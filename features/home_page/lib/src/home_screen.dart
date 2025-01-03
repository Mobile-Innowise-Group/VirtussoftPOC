import 'package:core/core.dart';
import 'package:domain/domain.dart';
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
      create: (_) => HomeBloc(
        synchronizeDataUseCase: appLocator<SynchronizeDataUseCase>(),
        appEventNotifier: appLocator<AppEventNotifier>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        return Stack(
          children: <Widget>[
            AutoTabsRouter.tabBar(
              routes: const <PageRouteInfo>[
                UserDataRoute(),
                ScannerRoute(),
                PrivateFoldersRoute(),
                UserProfileRoute(),
              ],
              builder: (BuildContext context, Widget child, TabController controller) {
                final TabsRouter tabsRouter = AutoTabsRouter.of(context);

                return Scaffold(
                  body: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : child,
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Theme.of(context).primaryColor,
                    unselectedItemColor: Colors.black54,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.data_usage),
                        label: 'Data',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.qr_code),
                        label: 'Scanner',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.lock),
                        label: 'Private Folders',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                    onTap: tabsRouter.setActiveIndex,
                    currentIndex: tabsRouter.activeIndex,
                  ),
                );
              },
            ),
            if (!state.isInternetConnected)
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 48,
                right: 48,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 50,
                  child: Center(
                    child: Text(
                      'No internet connection',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
