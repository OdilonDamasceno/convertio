import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:convertio/.env.dart';

class ExchangeProvider {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> getResouces() async {
    Response<Map<String, dynamic>> res = await _dio.get(env.url);
    debugPrint("Provider from json done");
    return res.statusCode == 200 ? res.data : null;
  }
}
