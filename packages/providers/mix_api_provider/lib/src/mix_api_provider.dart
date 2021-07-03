import 'package:dio/dio.dart';
import 'package:models/models.dart';

class HttpException implements Exception {
  String toString() {
    return 'خطأ أثناء الاتصال: طلب خاطئ';
  }
}

class HttpRequestException implements Exception {
  final int? status;
  final String? msg;

  HttpRequestException({
    required this.status,
    required this.msg,
  });

  String toString() {
    return '$status خطأ: $msg';
  }
}

class JsonDecodeException implements Exception {
  String toString() {
    return 'فك التشفير خاطئ:فشل التعرف على صيغة البيانات';
  }
}

class JsonDeserializationException implements Exception {
  String toString() {
    return 'فشل الاستحواذ على البيانات';
  }
}

class MixApiProvider {
  final String _endpoint = "https://mixcart.com.tr/api";
  final Dio _dio = Dio();

  Future<dynamic> getProducts() async {
    // List<Product>? products;
    // List rawProducts;
    try {
      Response response = await _dio.get(_endpoint + '/material');
      print('Products Info: ${response.data}');
      return response.data;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    // return products;
  }

  Future<List<Product>?> getHttp() async {
    late Response<List<Product>> response;
    try {
      response = await _dio.get<List<Product>>(_endpoint + '/material');
      return response.data;
    } catch (e) {
      throw HttpRequestException(
          status: response.statusCode, msg: response.statusMessage);
    }
  }
}
