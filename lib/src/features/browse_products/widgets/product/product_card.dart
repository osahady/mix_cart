import 'package:cached_network_image/cached_network_image.dart';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          'https://mixcart.com.tr/storage/${product.images[0].image}'),
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
