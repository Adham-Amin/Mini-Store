import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_store/core/widgets/height_sized.dart';
import 'package:mini_store/features/home/domain/entities/product_entity.dart';
import 'package:mini_store/features/home/presentation/widgets/custom_text_field.dart';
import 'package:mini_store/features/home/presentation/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingHome extends StatelessWidget {
  const LoadingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightSized(height: 16),
            CustomTextField(onChanged: (value) {}),
            HeightSized(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 16.w,
                ),
                itemCount: 6,
                itemBuilder: (context, index) => ProductItem(
                  product: ProductEntity(
                    idProduct: 0,
                    name: 'T-Shirt',
                    rate: 4,
                    count: 45,
                    overview: '',
                    priceProduct: 0,
                    imageUrl: '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
