// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:scanner/src/screens/home_scanner_screen/scanner_screen.dart'
    as _i3;
import 'package:scanner/src/screens/save_scan_screen/preview_pdf_result_screen.dart'
    as _i1;
import 'package:scanner/src/screens/save_scan_screen/saving_scan_entry_bottom_sheet_screen.dart'
    as _i2;

/// generated route for
/// [_i1.PreviewPdfResultScreen]
class PreviewPdfResultRoute
    extends _i4.PageRouteInfo<PreviewPdfResultRouteArgs> {
  PreviewPdfResultRoute({
    required String previewFilePath,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          PreviewPdfResultRoute.name,
          args: PreviewPdfResultRouteArgs(
            previewFilePath: previewFilePath,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviewPdfResultRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreviewPdfResultRouteArgs>();
      return _i1.PreviewPdfResultScreen(
        previewFilePath: args.previewFilePath,
        key: args.key,
      );
    },
  );
}

class PreviewPdfResultRouteArgs {
  const PreviewPdfResultRouteArgs({
    required this.previewFilePath,
    this.key,
  });

  final String previewFilePath;

  final _i5.Key? key;

  @override
  String toString() {
    return 'PreviewPdfResultRouteArgs{previewFilePath: $previewFilePath, key: $key}';
  }
}

/// generated route for
/// [_i2.SavingScanEntryBottomSheetScreen]
class SavingScanEntryBottomSheetRoute
    extends _i4.PageRouteInfo<SavingScanEntryBottomSheetRouteArgs> {
  SavingScanEntryBottomSheetRoute({
    required String previewFilePath,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SavingScanEntryBottomSheetRoute.name,
          args: SavingScanEntryBottomSheetRouteArgs(
            previewFilePath: previewFilePath,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SavingScanEntryBottomSheetRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingScanEntryBottomSheetRouteArgs>();
      return _i2.SavingScanEntryBottomSheetScreen(
        previewFilePath: args.previewFilePath,
        key: args.key,
      );
    },
  );
}

class SavingScanEntryBottomSheetRouteArgs {
  const SavingScanEntryBottomSheetRouteArgs({
    required this.previewFilePath,
    this.key,
  });

  final String previewFilePath;

  final _i5.Key? key;

  @override
  String toString() {
    return 'SavingScanEntryBottomSheetRouteArgs{previewFilePath: $previewFilePath, key: $key}';
  }
}

/// generated route for
/// [_i3.ScannerScreen]
class ScannerRoute extends _i4.PageRouteInfo<void> {
  const ScannerRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScannerRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i3.ScannerScreen());
    },
  );
}
