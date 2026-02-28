import 'package:dartz/dartz.dart';
import 'package:mini_store/core/error/failure.dart';
import 'package:mini_store/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
