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

  Future<Map<String, dynamic>> getHttp(
      {required Map<String, dynamic> qryParams}) async {
    late Response response;
    try {
      response = await _dio.get(
        _endpoint + '/material',
        queryParameters: qryParams,
      );
      print('Products Info: ${response.data}');
      return response.data;
    } catch (e) {
      throw HttpRequestException(
          status: response.statusCode, msg: response.statusMessage);
    }
  }
}
