import 'package:flutter/material.dart';
import 'package:news_appp_new/models/article_model.dart';
import 'package:news_appp_new/models/list_view_hrisintal_model.dart';
import 'package:news_appp_new/service/news_service.dart';
import 'package:news_appp_new/widget/listview_horsintal.dart';
import 'package:news_appp_new/widget/news_tile.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ListViewHrisintalModel> dataListHorsintal = [
    ListViewHrisintalModel(image: 'assets/bussnisee.jpg', titel: 'bussnisee'),
    ListViewHrisintalModel(
        image: "assets/entertaiment.avif", titel: 'entertaiment'),
    ListViewHrisintalModel(
        image: 'assets/generalImage.jpeg', titel: 'generalImage'),
    ListViewHrisintalModel(image: 'assets/health.avif', titel: 'health'),
    ListViewHrisintalModel(image: 'assets/science.avif', titel: 'science'),
    ListViewHrisintalModel(
        image: 'assets/SportImage.jpeg', titel: 'SportImage'),
    ListViewHrisintalModel(
        image: 'assets/technology.jpeg', titel: 'technology'),
  ];

  List<ArticleModel> articals = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    articals = await NewsService().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataListHorsintal.length,
                  itemBuilder: (context, index) {
                    return ListviewHorsintal(
                      image: dataListHorsintal[index].image,
                      titel: dataListHorsintal[index].titel,
                    );
                  }),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true, // تجعل الـ ListView تأخذ حجم العناصر فقط
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articals.length,
                itemBuilder: (context, index) {
                  return NewsTile(articleModel: articals[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
