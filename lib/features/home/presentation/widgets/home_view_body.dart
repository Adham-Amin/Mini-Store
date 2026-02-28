import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:mini_store/core/widgets/height_sized.dart';
import 'package:mini_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:mini_store/features/home/presentation/views/product_view.dart';
import 'package:mini_store/features/home/presentation/widgets/custom_text_field.dart';
import 'package:mini_store/features/home/presentation/widgets/loading_home.dart';
import 'package:mini_store/features/home/presentation/widgets/product_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<HomeCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSized(height: 16),
                CustomTextField(onChanged: (value) {}),
                HeightSized(height: 16),
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        ProductView.routeName,
                        arguments: state.products[index],
                      ),
                      child: ProductItem(product: state.products[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else if (state is HomeLoading) {
          return LoadingHome();
        } else {
          return Center(
            child: Text('حدث خطاء', style: AppStyles.textRegular16),
          );
        }
      },
    );
  }
}
