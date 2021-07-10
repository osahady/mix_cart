import 'package:mix_api_provider/mix_api_provider.dart';
import 'package:models/models.dart';

class BrowseProductsRepository {
  final _api = MixApiProvider();

  Future<List<Product>> getProducts({
    required Map<String, dynamic> qry,
  }) async {
    Map<String, dynamic> _res;
    try {
      _res = await _api.getHttp(qryParams: qry, path: '/material');
    } catch (e) {
      rethrow;
    }
    return _parseProducts(_res);
  }

  Future<List<Category>> getCategories({
    required Map<String, dynamic> qry,
  }) async {
    Map<String, dynamic> _res;
    try {
      _res = await _api.getHttp(qryParams: qry, path: '/category');
    } catch (e) {
      rethrow;
    }
    return _parseCategories(_res);
  }

  List<Product> _parseProducts(Map<String, dynamic> res) {
    List _rawProducts;
    List<Product> _products;
    try {
      _rawProducts = res['data'] as List;
      _products = _rawProducts.map((map) => Product.fromJson(map)).toList();
    } catch (e) {
      throw JsonDeserializationException();
    }
    return _products;
  }

  List<Category> _parseCategories(Map<String, dynamic> res) {
    List _rawCategorys;
    List<Category> _categories;
    try {
      _rawCategorys = res['data'] as List;
      _categories = _rawCategorys.map((e) => Category.fromJson(e)).toList();
    } catch (e) {
      throw JsonDeserializationException();
    }
    return _categories;
  }
}
