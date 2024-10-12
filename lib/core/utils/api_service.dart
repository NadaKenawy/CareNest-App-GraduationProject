import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://carenest-serverside.vercel.app/';
  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$baseUrl$endpoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post('$baseUrl$endpoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endpoint, required Map<String, dynamic> data}) async {
    var response = await _dio.put('$baseUrl$endpoint', data: data);
    return response.data;
  }
}
