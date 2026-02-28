import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/core/di/service_locator.dart';
import 'package:mini_store/core/utils/app_colors.dart';
import 'package:mini_store/core/utils/app_styles.dart';
import 'package:mini_store/features/home/domain/repos/home_repo.dart';
import 'package:mini_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:mini_store/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(homeRepo: getIt<HomeRepo>()),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: Text('متجر الملابس', style: AppStyles.textSemiBold32),
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
