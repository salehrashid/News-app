import 'dart:convert';

import 'package:news_app/model/model.dart';
import 'package:http/http.dart' as http;

String apiKey = '518075bdfc4a433a9ffeca01ee82c062';
String baseUrl = 'https://newsapi.org/v2/';

class News {
  //buat mengambil data news
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      return list;
    } else {
      throw Exception('Tidak mengambil data dari berita');
    }
  }

  Future<List<Article>?> getNewsByCategory(String category) async {
    List<Article>? list;
    String url =
        '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'];
      list = result.map((json) => Article.fromJson(json)).toList();
      return list;
    } else {
      throw Exception('Tidak mengambil data dari category');
    }
  }
}
