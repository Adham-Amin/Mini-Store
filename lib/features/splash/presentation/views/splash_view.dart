import 'package:flutter/material.dart';
import 'package:mini_store/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SplashViewBody());
  }
}
