import 'package:auto_route/auto_route.dart';
import 'homepage.dart';
import 'page_one.dart';
import 'page_two.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: FirstRoute.page,initial: true),
    AutoRoute(page: RouteOne.page),
    AutoRoute(page: RouteTwo.page),
  ];
}