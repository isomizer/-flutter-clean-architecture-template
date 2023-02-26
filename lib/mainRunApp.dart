import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_widget.dart';
import 'core/core_features/views/provider_observers.dart';
import 'core/jailbroken.dart';

void mainRunApp() async {
  if (kDebugMode) {
    debugPrint = (message, {wrapWidth}) {};
  }

  Chain.capture(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Intl.defaultLocale = 'th';
    initializeDateFormatting('th', null);

    runApp(
      ProviderScope(observers: [LogProviderObserver()], child: const MyApp()),
    );
  }).onError((error, stackTrace) {
    debugPrint('Error: $error\nStackTrace: ${stackTrace.toString()}');
  });

  jailBrokenCheck();
}
