import 'package:flutter/material.dart';
import 'package:mix/size_config.dart';
import 'package:models/models.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.url,
    required this.category,
  }) : super(key: key);

  final String url;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [
            Container(
              height: getProportionateScreenHeight(200),
              width: getProportionateScreenWidth(350),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: getProportionateScreenHeight(200),
              width: getProportionateScreenWidth(350),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF343434).withOpacity(.15),
                    Color(0xFF343434).withOpacity(.8),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 5,
              child: Text(
                '${category.name}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
