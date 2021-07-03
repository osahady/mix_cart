import 'package:mix_api_provider/mix_api_provider.dart';
import 'package:models/models.dart';
import 'package:dio/dio.dart';

class BrowseProductsRepository {
  final _api = MixApiProvider();

  Future<List<Product>> getProducts() async {
    Map<String, dynamic> res;
    try {
      res = await _api.getProducts();
    } catch (e) {
      rethrow;
    }
    List rawProducts;
    List<Product> products;
    try {
      rawProducts = res['data'] as List;
      products = rawProducts.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      throw JsonDeserializationException();
    }
    return products;
  }
}
