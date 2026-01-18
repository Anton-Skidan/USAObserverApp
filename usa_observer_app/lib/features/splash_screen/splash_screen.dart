import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:usa_observer_app/main/appRoutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const Duration _splashDuration = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(_splashDuration);

    if (!mounted) return;

    Navigator.of(context).pushReplacementNamed(
      AppRoutes.main,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Lottie.asset(
          'lib/assets/SplashScreenLottie.json',
          fit: BoxFit.contain,
          repeat: true,
        ),
      ),
    );
  }
}