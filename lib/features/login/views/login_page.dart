import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main_app/app_widget.dart';


class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..addStatusListener((status) {
      if (status != AnimationStatus.completed) return;
      // Update the logged in state after the animation for demo purposes.
      ref.read(loggedInProvider.notifier).state = true;
    });

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_controller.isAnimating)
                  CircularProgressIndicator(value: _controller.value)
                else
                  child!,
              ],
            );
          },
          child: ElevatedButton(
            onPressed: _controller.forward,
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}