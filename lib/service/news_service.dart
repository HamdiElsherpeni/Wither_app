import 'package:dio/dio.dart';
import 'package:news_appp_new/models/article_model.dart';

class NewsService {
  final Dio dio = Dio();

  Future<List<ArticleModel>> getNews() async {
    final Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=94f84e4a017746b39d713e080409d124');
    Map<String, dynamic> jesonData = response.data;
    List<dynamic> articals = jesonData["articles"];
    List<ArticleModel> articalsData = [];
    for (var element in articals) {
      ArticleModel articleModel = ArticleModel(
        image: element['urlToImage']??"https://th.bing.com/th/id/R.fa69700d5b12c1f0012a6641b4805bb5?rik=Isbaj4xprJDHtA&pid=ImgRaw&r=0",
        title: element['title']??" ",
        subtitel: element['description']??"",
      );
      articalsData.add(articleModel);

    }
    return articalsData;
  }
}
