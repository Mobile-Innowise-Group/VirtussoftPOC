import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
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
              builder: (BuildContext context, Widget child,
                  TabController controller) {
                final TabsRouter tabsRouter = AutoTabsRouter.of(context);

                return Scaffold(
                  body: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : child,
                  bottomNavigationBar: SizedBox(
                    height: 90,
                    child: BottomNavigationBar(
                      elevation: 0,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      selectedIconTheme: IconThemeData(
                          color: Theme.of(context).colorScheme.primary),
                      unselectedIconTheme: IconThemeData(
                          color: AppColors.of(context).unSelectedIcon),
                      selectedItemColor: Theme.of(context).colorScheme.primary,
                      unselectedItemColor: AppColors.of(context).unSelectedIcon,
                      selectedLabelStyle: AppFonts.actionS.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      unselectedLabelStyle: AppFonts.actionS.copyWith(
                        color: AppColors.of(context).unSelectedIcon,
                      ),
                      showUnselectedLabels: true,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Column(
                            children: <Widget>[
                              Icon(Icons.menu),
                              SizedBox(height: 8),
                            ],
                          ),
                          label: 'Data',
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            children: <Widget>[
                              Icon(Icons.qr_code),
                              SizedBox(height: 8),
                            ],
                          ),
                          label: 'Scan',
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            children: <Widget>[
                              Icon(Icons.lock),
                              SizedBox(height: 8),
                            ],
                          ),
                          label: 'Private',
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            children: <Widget>[
                              Icon(Icons.person),
                              SizedBox(height: 8),
                            ],
                          ),
                          label: 'Profile',
                        ),
                      ],
                      onTap: tabsRouter.setActiveIndex,
                      currentIndex: tabsRouter.activeIndex,
                    ),
                  ),
                );
              },
            ),
            if (!state.isInternetConnected)
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 48,
                right: 48,
                child: Material(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color.fromRGBO(59, 96, 106, 0.25),
                          blurRadius: 12,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        'No internet connection',
                        style: AppFonts.bodyS,
                      ),
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
