import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => ref.read(loggedInProvider.notifier).state = false,
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}