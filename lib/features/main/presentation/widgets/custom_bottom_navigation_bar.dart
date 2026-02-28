import 'package:mini_store/core/utils/app_assets.dart';
import 'package:mini_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onTap,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondary,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.imagesIconHome,
              width: 24,
              color: selectedIndex == 0
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.imagesIconCart,
              width: 24,
              color: selectedIndex == 1
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
            label: 'السلة',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.imagesIconUser,
              width: 24,
              color: selectedIndex == 2
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
            label: 'تسجيل الخروج',
          ),
        ],
      ),
    );
  }
}
