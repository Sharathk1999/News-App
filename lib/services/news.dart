import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_news_app/models/article_model.dart';

class News {
  List<ArticleModel> news = [];


  Future<void> getNews()async{
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2023-10-29&sortBy=publishedAt&apiKey=4189d7a7e2254f4d8f3671e4010372b0";
    var response = await http.get(Uri.parse(url),);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((article){
        if (article['description'] != null && article['urlToImage'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: article['title'],
            author: article['author'],
            description: article['description'],
            newsUrl: article['url'],
            imgUrl: article['urlToImage'],
            content: article['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}