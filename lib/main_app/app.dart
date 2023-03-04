import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../core/infrastructure/jailbroken.dart';
import 'app_widget.dart';
import '../core/views/providers/provider_observers.dart';

void app() async {
  // Disable debug print statements in debug mode
  if (kDebugMode) {
    debugPrint = (message, {wrapWidth}) {};
  }

  // Initialize Intl with the default locale and date formatting for Thai
  Intl.defaultLocale = 'th';
  await initializeDateFormatting('th', null);

  // Capture any errors that occur during app execution
  Chain.capture(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      ProviderScope(observers: [LogProviderObserver()], child: const MyApp()),
    );
  }).onError((error, stackTrace) {
    debugPrint('Error: $error\nStackTrace: ${stackTrace.toString()}');
  });

  // Check if the device is jailbroken
  jailBrokenCheck();
}
