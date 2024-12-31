// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:domain/domain.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:user_folders/src/folder_scan_list/folders_scan_list_screen.dart'
    as _i1;

/// generated route for
/// [_i1.FoldersScanListScreen]
class FoldersScanListRoute extends _i2.PageRouteInfo<FoldersScanListRouteArgs> {
  FoldersScanListRoute({
    required _i3.FolderModel folder,
    _i4.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          FoldersScanListRoute.name,
          args: FoldersScanListRouteArgs(
            folder: folder,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FoldersScanListRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FoldersScanListRouteArgs>();
      return _i2.WrappedRoute(
          child: _i1.FoldersScanListScreen(
        folder: args.folder,
        key: args.key,
      ));
    },
  );
}

class FoldersScanListRouteArgs {
  const FoldersScanListRouteArgs({
    required this.folder,
    this.key,
  });

  final _i3.FolderModel folder;

  final _i4.Key? key;

  @override
  String toString() {
    return 'FoldersScanListRouteArgs{folder: $folder, key: $key}';
  }
}
