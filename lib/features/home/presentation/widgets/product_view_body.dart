import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:mini_store/core/widgets/custom_button.dart';
import 'package:mini_store/core/widgets/height_sized.dart';
import 'package:mini_store/core/widgets/width_sized.dart';
import 'package:mini_store/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightSized(height: 20),
            Container(
              width: double.infinity,
              height: 386.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  widget.product.imageUrl,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            HeightSized(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textSemiBold32.copyWith(fontSize: 22.sp),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                  style: IconButton.styleFrom(
                    minimumSize: const Size(32, 32),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.gray),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  icon: const Icon(Icons.remove, size: 18),
                ),
                WidthSized(width: 8),
                Text(quantity.toString(), style: AppStyles.textMedium16),
                WidthSized(width: 8),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  style: IconButton.styleFrom(
                    minimumSize: const Size(32, 32),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.gray),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 18),
                ),
              ],
            ),
            HeightSized(height: 12),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                WidthSized(width: 4),
                Text(
                  '${widget.product.rate} / 5',
                  style: AppStyles.textMedium16.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                WidthSized(width: 4),
                Text(
                  '(${widget.product.count} تقييم)',
                  style: AppStyles.textMedium16.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
            HeightSized(height: 12),
            Text(
              widget.product.overview.isEmpty
                  ? 'لا يوجد وصف متاح لهذا المنتج.'
                  : widget.product.overview,
              style: AppStyles.textRegular16.copyWith(
                color: AppColors.secondary,
              ),
            ),
            const Spacer(),
            Divider(color: AppColors.gray, height: 20.h),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'السعر',
                        style: AppStyles.textRegular16.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                      Text(
                        '${(widget.product.priceProduct * quantity).toStringAsFixed(2)} ريال',
                        style: AppStyles.textSemiBold32.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CustomButton(
                    title: 'إضافة إلى السلة',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            HeightSized(height: 32),
          ],
        ),
      ),
    );
  }
}
