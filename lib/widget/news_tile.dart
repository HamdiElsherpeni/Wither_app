import 'package:flutter/material.dart';
import 'package:news_appp_new/models/article_model.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key, required this.articleModel, 
  });
  // final String image;
  // final String titel;
  // final String subtitel;
  // final ArticleModel articleModel;

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
           articleModel.image??"https://th.bing.com/th/id/R.fa69700d5b12c1f0012a6641b4805bb5?rik=Isbaj4xprJDHtA&pid=ImgRaw&r=0",
                height: 200,
                errorBuilder:(context, error, stackTrace) {
                  return Image.asset('assets/news.jpg');
                },
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 12,
          ),
          Text(
            articleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
            Text(
            
                articleModel.subtitel??"",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          )
        ],
      ),
    );
  }
}
