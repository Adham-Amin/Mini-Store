import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_store/core/utils/app_assets.dart';
import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:mini_store/core/widgets/height_sized.dart';
import 'package:mini_store/features/home/domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: product.imageUrl.isEmpty
                ? Image.asset(
                    AppAssets.imagesProductTest,
                    width: double.infinity,
                    height: 174.h,
                  )
                : Image.network(
                    product.imageUrl,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                    width: double.infinity,
                    height: 174.h,
                    fit: BoxFit.contain,
                  ),
          ),
        ),

        HeightSized(height: 8),

        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textRegular16.copyWith(fontWeight: FontWeight.w600),
        ),

        HeightSized(height: 4),

        Text(
          '${product.priceProduct} ريال',
          style: AppStyles.textMedium12.copyWith(color: AppColors.secondary),
        ),
      ],
    );
  }
}
