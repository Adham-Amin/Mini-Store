import 'package:mini_store/core/services/api_service.dart';
import 'package:mini_store/features/home/data/models/product_response/product_response.dart';

abstract class RemoteHomeDataSource {
  Future<List<ProductResponse>> getProducts();
}

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
  final ApiService apiService;
  RemoteHomeDataSourceImpl({required this.apiService});

  @override
  Future<List<ProductResponse>> getProducts() async {
    var data = await apiService.get(endPoint: '/products');

    List<ProductResponse> products = [];
    for (var product in data['products']) {
      products.add(ProductResponse.fromJson(product));
    }
    return products;
  }
}
