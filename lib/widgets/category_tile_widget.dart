import 'package:flutter/material.dart';
import 'package:the_news_app/screens/category_news_screen.dart';

class CategoryTileWidget extends StatelessWidget {
  final String image;
  final String categoryName;
  const CategoryTileWidget({
    super.key,
    required this.image,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNewsScreen(name: categoryName),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                width: 180,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 180,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black45),
              child: Center(
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Hind',
                    letterSpacing: 1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
