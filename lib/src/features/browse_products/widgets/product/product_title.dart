import 'package:flutter/material.dart';
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
      style: TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
