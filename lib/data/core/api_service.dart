import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_constants.dart';

class ApiService {

  final url = ApiConstants.baseUrl + ApiConstants.apkiKey;
  final header = {'Content-Type': 'application/json'};

  Future<Map<String, dynamic>> getData(String msg) async {
    var data = {"contents": [{"parts": [{"text": msg}]}]};
    final resp = await http.post(Uri.parse(url), headers: header, body: jsonEncode(data));

    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}