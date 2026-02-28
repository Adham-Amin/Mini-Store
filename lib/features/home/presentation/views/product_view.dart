import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:mini_store/features/home/domain/entities/product_entity.dart';
import 'package:mini_store/features/home/presentation/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final ProductEntity product;
  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'تفاصيل المنتج',
          style: AppStyles.textSemiBold32.copyWith(fontSize: 24.sp),
        ),
        centerTitle: true,
      ),
      body: ProductViewBody(product: product),
    );
  }
}
