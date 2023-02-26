import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/home/views/home_page.dart';
import '../../../../features/login/views/login_page.dart';
import 'routes.dart';

class GoRoutes {
  const GoRoutes._();

  static dynamic routes(GlobalKey<NavigatorState> shellNav) => [
        GoRoute(
          path: Routes.homePage,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: Routes.loginPage,
          builder: (context, state) => const LoginPage(),
        ),
      ];
}
