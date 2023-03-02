import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../main_app/app_widget.dart';
import '../routes/global_navigator_keys.dart';
import '../routes/go_routes.dart';
import '../routes/routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final loggedIn = ref.watch(loggedInProvider);
  return GoRouter(
    initialLocation: Routes.homePage,
    navigatorKey: GlobalNavigatorKeys.rootNavigator,
    routes: GoRoutes.routes(GlobalNavigatorKeys.shellNavigator),
    redirect: (context, state) {
     // The redirection function is completely customizable and
      // is called for both dependency changes and internal navigation.
      final loggingIn = state.location == '/login';
      if (!loggedIn) {
        if (!loggingIn) return '/login';
        return null;
      }

      if (loggingIn) return '/';
      return null;
    },
  );
});
