import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/features/home/domain/entities/product_entity.dart';
import 'package:mini_store/features/home/domain/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> getProducts() async {
    emit(HomeLoading());
    final result = await homeRepo.getProducts();
    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(HomeLoaded(products: products)),
    );
  }
}
