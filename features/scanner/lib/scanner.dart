library scanner;

import 'dart:ui';

import 'package:flutter/material.dart';
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
        CustomRoute<AutoRoute>(
          page: PreviewPdfResultRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
          opaque: false,
          barrierColor: const Color.fromRGBO(0, 0, 0, 0.5),
        ),
        CustomRoute<AutoRoute>(
          page: SavingScanEntryBottomSheetRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 300,
          opaque: false,
          barrierColor: const Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ];
}
