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
import 'package:user_categories/src/categorized_documents_list/categorized_document_list_screen.dart'
    as _i1;

/// generated route for
/// [_i1.CategorizedDocumentListScreen]
class CategorizedDocumentListRoute
    extends _i2.PageRouteInfo<CategorizedDocumentListRouteArgs> {
  CategorizedDocumentListRoute({
    required _i3.CategoryModel category,
    _i4.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          CategorizedDocumentListRoute.name,
          args: CategorizedDocumentListRouteArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategorizedDocumentListRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategorizedDocumentListRouteArgs>();
      return _i2.WrappedRoute(
          child: _i1.CategorizedDocumentListScreen(
        category: args.category,
        key: args.key,
      ));
    },
  );
}

class CategorizedDocumentListRouteArgs {
  const CategorizedDocumentListRouteArgs({
    required this.category,
    this.key,
  });

  final _i3.CategoryModel category;

  final _i4.Key? key;

  @override
  String toString() {
    return 'CategorizedDocumentListRouteArgs{category: $category, key: $key}';
  }
}
