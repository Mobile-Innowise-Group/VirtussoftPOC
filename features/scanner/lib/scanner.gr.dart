// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:scanner/src/screens/home_scanner_screen/scanner_screen.dart'
    as _i2;
import 'package:scanner/src/screens/save_scan_screen/saving_scan_entry_bottom_sheet_screen.dart'
    as _i1;

/// generated route for
/// [_i1.SavingScanEntryBottomSheetScreen]
class SavingScanEntryBottomSheetRoute
    extends _i3.PageRouteInfo<SavingScanEntryBottomSheetRouteArgs> {
  SavingScanEntryBottomSheetRoute({
    required String scanPath,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          SavingScanEntryBottomSheetRoute.name,
          args: SavingScanEntryBottomSheetRouteArgs(
            scanPath: scanPath,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SavingScanEntryBottomSheetRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingScanEntryBottomSheetRouteArgs>();
      return _i3.WrappedRoute(
          child: _i1.SavingScanEntryBottomSheetScreen(
        scanPath: args.scanPath,
        key: args.key,
      ));
    },
  );
}

class SavingScanEntryBottomSheetRouteArgs {
  const SavingScanEntryBottomSheetRouteArgs({
    required this.scanPath,
    this.key,
  });

  final String scanPath;

  final _i4.Key? key;

  @override
  String toString() {
    return 'SavingScanEntryBottomSheetRouteArgs{scanPath: $scanPath, key: $key}';
  }
}

/// generated route for
/// [_i2.ScannerScreen]
class ScannerRoute extends _i3.PageRouteInfo<void> {
  const ScannerRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScannerRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i2.ScannerScreen());
    },
  );
}
