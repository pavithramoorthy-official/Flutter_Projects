import 'package:auto_route/auto_route.dart';
import 'package:savings_admin/core/router/app_router.gr.dart';
import 'package:savings_admin/feature/add_products/model/product_model.dart';
import 'package:savings_admin/feature/dashboard/dashboard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: AddProductRoute.page,path : "/add-product"),
        AutoRoute(page: ViewProductRoute.page),
      ];
}


