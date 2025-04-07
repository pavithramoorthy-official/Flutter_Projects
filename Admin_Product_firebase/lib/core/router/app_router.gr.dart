// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:savings_admin/feature/add_products/add_product.dart' as _i1;
import 'package:savings_admin/feature/add_products/model/product_model.dart'
    as _i7;
import 'package:savings_admin/feature/dashboard/dashboard.dart' as _i2;
import 'package:savings_admin/feature/login/login.dart' as _i3;
import 'package:savings_admin/feature/view_products/view_product.dart' as _i4;

/// generated route for
/// [_i1.AddProductPage]
class AddProductRoute extends _i5.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({
    _i6.Key? key,
    _i7.ProductModel? product,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         AddProductRoute.name,
         args: AddProductRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'AddProductRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddProductRouteArgs>(
        orElse: () => const AddProductRouteArgs(),
      );
      return _i1.AddProductPage(key: args.key, product: args.product);
    },
  );
}

class AddProductRouteArgs {
  const AddProductRouteArgs({this.key, this.product});

  final _i6.Key? key;

  final _i7.ProductModel? product;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.ViewProductPage]
class ViewProductRoute extends _i5.PageRouteInfo<void> {
  const ViewProductRoute({List<_i5.PageRouteInfo>? children})
    : super(ViewProductRoute.name, initialChildren: children);

  static const String name = 'ViewProductRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ViewProductPage();
    },
  );
}
