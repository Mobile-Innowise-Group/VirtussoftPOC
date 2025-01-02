import 'dart:async';

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:navigation/navigation.dart';

import 'error_handler/provider/app_error_handler_provider.dart';
import 'notifications/widget/app_notifications.dart';

Future<void> mainCommon(Flavor flavor) async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await dotenv.load();

    _setupDI(flavor);
    Bloc.observer = AppBlocObserver();
    Intl.defaultLocale = 'en_US';

    runApp(const App());
  }, (Object error, StackTrace stack) {
    AppLogger().wtf(error.toString());
  });
}

void _setupDI(Flavor flavor) {
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) async {
      AppDI.initDependencies(appLocator, flavor);
      DataDI.initDependencies(
        locator: appLocator,
        provider: ProviderInstance.supabaseProviderInstanceName,
      );
      DomainDI.initDependencies(appLocator);
      NavigationDI.initDependencies(appLocator);
    },
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();

    return EasyLocalization(
      path: AppLocalization.langFolderPath,
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: Builder(
        builder: (BuildContext context) {
          return AppErrorHandlerProvider(
            child: MaterialApp.router(
              onGenerateTitle: (BuildContext context) => 'Title',
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(
                navigatorObservers: () => <NavigatorObserver>[
                  AppRouteObserver(),
                ],
              ),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              //theme: lightTheme,
              builder: (BuildContext context, Widget? child) {
                return AppNotifications(
                  child: child ?? const SizedBox(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
