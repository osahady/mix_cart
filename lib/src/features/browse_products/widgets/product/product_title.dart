import 'package:flutter/material.dart';
import 'package:mix/constants.dart';
import 'package:models/models.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${product.name} ',
      maxLines: 3,
      style: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
