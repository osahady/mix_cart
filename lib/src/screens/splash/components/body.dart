import 'package:flutter/material.dart';
import 'package:mix/constants.dart';
import 'package:mix/src/components/components.dart';
import 'package:mix/src/features/browse_products/view/products_page.dart';
import 'package:mix/src/screens/splash/components/components.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "مرحبًا بكم في عالم التسوق",
      "imagePath": "assets/images/1.png",
    },
    {
      "text": "ميزات أكبر وراحة أكثر",
      "imagePath": "assets/images/2.png",
    },
    {
      "text": "نصلك بالعالم",
      "imagePath": "assets/images/3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (val) {
                  setState(() {
                    currentPage = val;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text'] ?? 'مرحبا',
                  imagePath: splashData[index]['imagePath'] ?? '',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(flex: 3),
                  DefaultButton(
                    text: 'متابعة',
                    press: () {
                      Navigator.pushNamed(context, ProductsPage.routeName);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 6),
      height: 6,
      width: currentPage == index ? 12 : 6,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
    );
  }
}
