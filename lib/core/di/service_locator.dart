import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mini_store/core/services/api_service.dart';
import 'package:mini_store/features/home/data/data_sources/remote_home_data_source.dart';
import 'package:mini_store/features/home/data/repos/home_repo_impl.dart';
import 'package:mini_store/features/home/domain/repos/home_repo.dart';

final getIt = GetIt.instance;

void serverLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<RemoteHomeDataSource>(
    () => RemoteHomeDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(remoteHomeDataSource: getIt<RemoteHomeDataSource>()),
  );
}
