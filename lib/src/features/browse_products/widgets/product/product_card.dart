import 'package:flutter/material.dart';
import 'package:mix/constants.dart';
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
                    ProductTitle(product: product),
                    Text(
                      '${product.summary} ${index + 1}',
                      maxLines: 3,
                    )
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
      child: Container(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                //TODO:1 rendering
                Column(
                  children: [
                    ItemImage(url: url),
                    ProductTitle(product: product),
                    ProductSummary(product: product),
                  ],
                ),
                PriceWidget(product: product),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductSummary extends StatelessWidget {
  const ProductSummary({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final summary = _trimingSummery(product.summary);
    print(summary);
    return Text(
      '$summary',
      maxLines: 3,
    );
  }

  String _trimingSummery(String summary) {
    String summary = product.summary;
    summary = summary.replaceAll('###', '');
    // summary = summary.replaceAll('سم', 'سم\n');
    // summary = summary.replaceAll('| --------- | -------- |', '\n');
    summary = summary.replaceAll('\n\n', '\n');
    summary = summary.replaceAll('\n\n', '\n');
    summary = summary.replaceAll('\n\n\n', '\n');
    summary = summary.replaceAll('\n\n\n\n', '\n');
    return summary;
  }
}
