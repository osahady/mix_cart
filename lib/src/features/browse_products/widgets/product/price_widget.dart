import 'package:flutter/material.dart';
import 'package:models/models.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        alignment: Alignment.center,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        width: 100,
        child: Text('\$${product.price.toStringAsFixed(2)}'),
      ),
      bottom: 0,
      left: 0,
    );
  }
}
