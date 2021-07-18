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
      );
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ProductTitle(product: product),
                      ),
                      SizedBox(height: 20),
                      PriceWidget(product: product),
                    ],
                  ),
                  ItemImage(url: url),
                ],
              ),
              SizedBox(height: 20),
              ProductSummary(product: product),
            ],
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
