import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                UserProfileRoute(),
                UserDataRoute(),
                PrivateFoldersRoute(),
                ScannerRoute(),
              ],
              builder: (BuildContext context, Widget child, TabController controller) {
                final TabsRouter tabsRouter = AutoTabsRouter.of(context);

                return Scaffold(
                  body: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : child,
                  bottomNavigationBar: SizedBox(
                    height: 90,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        elevation: 0,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        selectedItemColor: Theme.of(context).colorScheme.primary,
                        unselectedItemColor: AppColors.of(context).unSelectedIcon,
                        selectedLabelStyle: AppFonts.actionS.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        unselectedLabelStyle: AppFonts.actionS.copyWith(
                          color: AppColors.of(context).unSelectedIcon,
                        ),
                        showUnselectedLabels: true,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              AppImages.profile,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                AppColors.of(context).unSelectedIcon,
                                BlendMode.srcIn,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              AppImages.profile,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: 'Profile',
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              AppImages.data,
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                AppColors.of(context).unSelectedIcon,
                                BlendMode.srcIn,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              AppImages.data,
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: 'Data',
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              AppImages.private,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                AppColors.of(context).unSelectedIcon,
                                BlendMode.srcIn,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              AppImages.private,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: 'Private',
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              AppImages.scan,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                AppColors.of(context).unSelectedIcon,
                                BlendMode.srcIn,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              AppImages.scan,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            label: 'Scan',
                          ),
                        ],
                        onTap: tabsRouter.setActiveIndex,
                        currentIndex: tabsRouter.activeIndex,
                      ),
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
