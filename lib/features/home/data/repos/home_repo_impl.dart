import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_store/core/error/failure.dart';
import 'package:mini_store/features/home/data/data_sources/remote_home_data_source.dart';
import 'package:mini_store/features/home/domain/entities/product_entity.dart';
import 'package:mini_store/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final RemoteHomeDataSource remoteHomeDataSource;
  HomeRepoImpl({required this.remoteHomeDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await remoteHomeDataSource.getProducts();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
