import 'package:dio/dio.dart';
import 'package:ecommerce/consts.dart';

class HTTPService {
  final Dio _dio = Dio();

  HTTPService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: "https://swan.alisonsnewdemo.online/api/",
      queryParameters: {
        "api_key": TOKENAPI,
      },
    );
  }
  Future<dynamic> post(String path) async {
    try {
      Response response = await _dio.post(path,data: {'id': "bDy", 'token': 'QsxaRD8wWNL5ycmDDuDBZoqb8yzfzFmzZOUKv04B'});
      
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> get(String path) async {
    try {
      Response response = await _dio.get(path);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
