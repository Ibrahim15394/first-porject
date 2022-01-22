import 'package:dio/dio.dart';
import 'package:first_project/models/news_app/news_article.dart';

 class DioHelper
  {
  static late Dio dio ;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl:'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
 static Future<Response> getData({
   required String url,
   required Map <String,dynamic> query,
})async
  {
    return await dio.get(
       url,
       queryParameters: query,
    );
  }

  Future<List<Articles>?> fetchNewsArticle(url)async {
    try {
      Response response = await dio.get(url);
      NewsArticle newsArticle = NewsArticle.fromJson(response.data);
      return newsArticle.articles;
    }on DioError catch(e){
      print(e);
    }
  }

}