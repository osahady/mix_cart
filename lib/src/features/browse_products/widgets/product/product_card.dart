import 'package:flutter/material.dart';
import 'package:mix/src/features/browse_products/widgets/widgets.dart';
import 'package:models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    String url;

    try {
      url = "https://mixcart.com.tr/storage/${product.images[0].image}";
    } catch (e) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                //TODO:1 rendering
                Column(
                  children: [
                    ErrorItemImage(),
                    SizedBox(height: 20),
                    ProductTitle(product: product),
                    SizedBox(height: 30),
                    Text('وصف المنتج ${index + 1}')
                  ],
                ),
                PriceWidget(product: product),
              ],
            ),
          ),
        ),
      );
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              //TODO:1 rendering
              Column(
                children: [
                  ItemImage(url: url),
                  SizedBox(height: 20),
                  ProductTitle(product: product),
                  SizedBox(height: 30),
                  Text('وصف المنتج ${index + 1}')
                ],
              ),
              PriceWidget(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
