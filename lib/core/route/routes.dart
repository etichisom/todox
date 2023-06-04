import 'package:go_router/go_router.dart';
import 'package:todox/core/base/base.dart';
import 'package:todox/core/route/app_routes.dart';

class AppRoute {
  static final router = GoRouter(
    initialLocation: AppPages.base,
    routes: [
      GoRoute(
        path: AppPages.base,
        builder: (context, state) => const BasePage(),
      ),
    ],
  );
}
