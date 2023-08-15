import 'package:activity_monitor/src/features/auth/Repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/route_constants.dart';
import '../../../ui_utils/app_snack_bar.dart';
import '../providers/Notifiers/auth_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(authController);
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, minimumSize: const Size(150, 50)),
          onPressed: () async {
            void success() {
              const AppSnackBar(
                      message: "Successfully logged In", isPositive: true)
                  .showAppSnackBar(context);
            }

            void failure() {
              AppSnackBar(
                message: controller.errorModel?.error.toString(),
              ).showAppSnackBar(context);
            }

            final value = await controller.signInWithGoogle();
            if (value) {
              ref.read(keyValueStorageProvider).setAuthState();
              success();
              Navigator.pushNamed(context, RouteConstants.homeScreen);
            } else {
              failure();
            }
          },
          icon: const Icon(Icons.image),
          label: const Text(
            'Sign in with Google',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
