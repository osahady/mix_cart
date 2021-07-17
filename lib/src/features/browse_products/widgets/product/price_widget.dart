import 'package:flutter/material.dart';
import 'package:mix/size_config.dart';
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
        height: getProportionateScreenHeight(30),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        width: getProportionateScreenWidth(100),
        child: Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(13),
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      bottom: 0,
      left: 0,
    );
  }
}
