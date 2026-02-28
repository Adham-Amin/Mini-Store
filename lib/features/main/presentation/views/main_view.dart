import 'package:mini_store/core/services/secure_storage.dart';
import 'package:mini_store/features/auth/presentation/views/login_view.dart';
import 'package:mini_store/features/home/presentation/views/home_view.dart';
import 'package:mini_store/features/main/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  final List<Widget> views = const [
    HomeView(),
    Center(child: Text('Cart')),
    SizedBox(),
  ];

  Future<void> _logout() async {
    await SecureStorage.delete(key: 'token');
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, LoginView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          if (index == 2) {
            _logout();
          } else {
            setState(() => selectedIndex = index);
          }
        },
      ),
    );
  }
}
