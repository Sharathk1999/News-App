import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_news_app/screens/article_webview_screen.dart';

// ignore: must_be_immutable
class BlogTileWidget extends StatelessWidget {
  String imgUrl, title, description, newsUrl;

  BlogTileWidget(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.newsUrl,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleWebViewScreen(blogUrl: newsUrl),));
      },
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    imageUrl: imgUrl,
                    errorWidget: (context, url, error) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        child:const Center(
                          child: Text(
                            "No Image",
                            style: TextStyle(
                              fontFamily: 'Hind',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          title,
                          maxLines: 2,
                          style:const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          description,
                          maxLines: 3,
                          style:const TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
