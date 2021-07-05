import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final int index;

  const ProductTile({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      child: ListTile(
        leading: _buildLeadingImage(product.images[0].image),
        title: _buildTitle(product.name),
        subtitle: _buildSubtitle(product.summary),
        trailing: Column(
          children: [
            Text(product.price.toStringAsFixed(2)),
            Text('$index'),
          ],
        ),
      ),
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildLeadingImage(String image) {
    try {
      String url = "https://mixcart.com.tr/storage/$image";

      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );

      // return CachedNetworkImage(
      //   imageUrl: url,
      //   progressIndicatorBuilder: (context, url, downloadProgress) =>
      //       CircularProgressIndicator(value: downloadProgress.progress),
      //   errorWidget: (context, url, error) => Icon(Icons.error),
      // );

      // return Image(image: CachedNetworkImageProvider(url));

    } catch (e) {
      print('error in the picture');
      rethrow;
    }
  }

  Widget _buildSubtitle(String summary) {
    String subtitle = summary.replaceAll('\n', '');
    // replaceAll('0x0a', '')
    return Text(
      '$subtitle',
      textDirection: TextDirection.rtl,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTitle(String name) {
    return Text(
      '${product.name}',
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
    );
  }
}
