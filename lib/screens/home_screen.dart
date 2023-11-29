import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_news_app/models/category_model.dart';
import 'package:the_news_app/models/slider_model.dart';
import 'package:the_news_app/services/data.dart';
import 'package:the_news_app/widgets/category_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliderItems = [];

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    sliderItems = getSliderItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
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
      body: SingleChildScrollView(
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
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Breaking News",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Hind'),
                  ),
                  Text(
                    "view all",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                      fontFamily: 'Hind',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              itemCount: sliderItems.length,
              itemBuilder: (context, index, realIndex) {
                String? name = sliderItems[index].name;
                String? image = sliderItems[index].image;
                return buildSliderImage(
                  name!,
                  index,
                  image!,
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
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending News",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Hind'),
                  ),
                  Text(
                    "view all",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                      fontFamily: 'Hind',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/entertainment.jpg",
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Text(
                              'Woman undergoing Agniveer training dies by suicide at Navy hostel in Mumbai',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Text(
                              'Woman undergoing Agniveer training dies by suicide',
                              style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
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
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width,
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
      count: sliderItems.length,
      effect: const WormEffect(
        activeDotColor: Colors.red,
        dotColor: Colors.black26,
        dotHeight: 10,
        dotWidth: 12,
      ),
    );
  }
}
