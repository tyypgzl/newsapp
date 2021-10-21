import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newsapp/core/components/constants/news_api_const.dart';
import 'package:newsapp/feature/home/model/news_model.dart';

class NewsServices {
  Future<List<Articles>> getNews({required String categoryName}) async {
    final _url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=tr&category=$categoryName&apiKey=${NewsApiConst.apiKey}");
    final response = await http.get(_url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = jsonDecode(response.body);
      return (jsonBody['articles'] as List<dynamic>)
          .map((e) => Articles.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception("Response Status Error:${response.statusCode}");
    }
  }
}
