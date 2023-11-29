import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_news_app/screens/article_webview_screen.dart';

class ShowCategoryWidget extends StatelessWidget {
  final String imgUrl, description, title, newsUrl;
  const ShowCategoryWidget({
    super.key,
    required this.imgUrl,
    required this.description,
    required this.title,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleWebViewScreen(blogUrl: newsUrl),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: MediaQuery.of(context).size.width,
                height: 210,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 210,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Image Unavailable',
                        style: TextStyle(
                          fontFamily: 'Hind',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Hind',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontFamily: 'Hind',
                color: Colors.black38,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black.withOpacity(0.2),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
