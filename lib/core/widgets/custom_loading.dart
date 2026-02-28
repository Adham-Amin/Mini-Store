import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_store/core/utils/app_assets.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(AppAssets.lottieLoadingLottie, width: 200),
    );
  }
}
