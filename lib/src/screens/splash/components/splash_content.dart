import 'package:flutter/material.dart';
import 'package:mix/constants.dart';
import 'package:mix/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);
  final String text, imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'Mix Cart',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          imagePath,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(400),
        ),
      ],
    );
  }
}
