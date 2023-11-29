import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_news_app/models/article_model.dart';
import 'package:the_news_app/models/category_model.dart';
import 'package:the_news_app/models/slider_model.dart';
import 'package:the_news_app/screens/all_news_screen.dart';
import 'package:the_news_app/services/data.dart';
import 'package:the_news_app/services/news.dart';
import 'package:the_news_app/services/slider_data.dart';
import 'package:the_news_app/utils/dot_loader_widget.dart';
import 'package:the_news_app/widgets/blogs_title_widget.dart';
import 'package:the_news_app/widgets/category_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliderItems = [];
  List<ArticleModel> articles = [];
  bool _isLoading = true;

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getSliderNews();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  getSliderNews() async {
    SliderNews sliderNews = SliderNews();
    await sliderNews.getSliderNews();
    sliderItems = sliderNews.sliderList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Hind'),
            ),
            Text(
              'App',
              style: TextStyle(color: Colors.black, fontFamily: 'Hind'),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const LoaderWidget()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    padding: const EdgeInsets.only(left: 10),
                    // decoration: BoxDecoration(color: Colors.red.withOpacity(0.3)),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTileWidget(
                          image: categories[index].image!,
                          categoryName: categories[index].categoryName!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Padding(
                    padding:const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const  Text(
                          "Breaking News",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Hind'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const AllNewsScreen(news: 'Breaking'),),);
                          },
                          child:const Text(
                            "view all",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.blue,
                              fontFamily: 'Hind',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      String? name = sliderItems[index].title;
                      String? imgUrl = sliderItems[index].imgUrl;
                      return buildSliderImage(
                        name!,
                        index,
                        imgUrl!,
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(child: buildSliderIndicator()),
                  const SizedBox(
                    height: 20,
                  ),
                   Padding(
                    padding:const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     const  Text(
                          "Trending News",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Hind'),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const AllNewsScreen(news: 'Trending'),),);
                          },
                          child:const Text(
                            "view all",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.blue,
                              fontFamily: 'Hind',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTileWidget(
                        imgUrl: articles[index].imgUrl!,
                        title: articles[index].title!,
                        description: articles[index].description!,
                        newsUrl: articles[index].newsUrl!,
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }

  Widget buildSliderImage(String name, int index, String image) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width,
              imageUrl: image,
            ),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 130),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              name,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Hind'),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSliderIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 5,
      effect: const WormEffect(
        activeDotColor: Colors.red,
        dotColor: Colors.black26,
        dotHeight: 10,
        dotWidth: 12,
      ),
    );
  }
}
