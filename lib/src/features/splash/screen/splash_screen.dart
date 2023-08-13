import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../routing/route_constants.dart';
import '../../../services/connectivity_service_provider.dart/connectivity_service_provider.dart';
import '../../../ui_utils/app_snack_bar.dart';
import '../../../utils/utils.dart';
import '../../../constants/string_constants.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _startTimer();
    super.initState();
  }

  void _startTimer() async {
    Future.delayed(const Duration(seconds: 1), _moveToNextPage);
  }

  void _moveToNextPage() {
    Navigator.of(context).pushReplacementNamed(RouteConstants.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<ConnectionStatus>>(
      connectionStreamProvider,
      (prevState, newState) {
        newState.whenOrNull(
          data: (status) {
            String message = status == ConnectionStatus.disconnected
                ? 'Your Disconnected'
                : 'Your Back Online';
            AppSnackBar(isPositive: true, message: message)
                .showAppSnackBar(context);
          },
        );
      },
    );
    return Scaffold(
      body: Container(
          color: AppColors.primaryColor,
          child: Center(child: Text(StringConstants.appName.tr(context)))),
    );
  }
}
