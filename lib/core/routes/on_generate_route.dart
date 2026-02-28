import 'package:flutter/material.dart';
import 'package:mini_store/features/auth/presentation/views/login_phone_view.dart';
import 'package:mini_store/features/auth/presentation/views/login_view.dart';
import 'package:mini_store/features/auth/presentation/views/verify_phone_view.dart';
import 'package:mini_store/features/home/domain/entities/product_entity.dart';
import 'package:mini_store/features/home/presentation/views/product_view.dart';
import 'package:mini_store/features/main/presentation/views/main_view.dart';
import 'package:mini_store/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case ProductView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            ProductView(product: settings.arguments as ProductEntity),
      );
    case LoginPhoneView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginPhoneView());
    case VerifyPhoneView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            VerifyPhoneView(phone: settings.arguments as String),
      );
    default:
      return MaterialPageRoute(
        builder: (context) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
      );
  }
}
