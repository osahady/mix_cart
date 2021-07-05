import 'package:mix_api_provider/mix_api_provider.dart';
import 'package:models/models.dart';

class BrowseProductsRepository {
  final _api = MixApiProvider();

  Future<List<Product>> getProducts({
    required Map<String, dynamic> qry,
  }) async {
    Map<String, dynamic> res;
    try {
      res = await _api.getHttp(qryParams: qry, path: '/material');
    } catch (e) {
      rethrow;
    }
    List rawProducts;
    List<Product> products;
    try {
      rawProducts = res['data'] as List;
      products = rawProducts.map((map) => Product.fromMap(map)).toList();
    } catch (e) {
      throw JsonDeserializationException();
    }
    return products;
  }

  Future<List<Category>> getCategories({
    required Map<String, dynamic> qry,
  }) async {
    Map<String, dynamic> res;
    try {
      res = await _api.getHttp(qryParams: qry, path: '/category');
    } catch (e) {
      rethrow;
    }
    List rawCategorys;
    List<Category> categories;
    try {
      rawCategorys = res['data'] as List;
      categories = rawCategorys.map((e) => Category.fromJson(e)).toList();
    } catch (e) {
      throw JsonDeserializationException();
    }
    return categories;
  }
}
