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
    return ListTile(
      leading: _buildLeadingImage(product.images[0].image),
      title: Text('${product.name}'),
      subtitle: Text(
        '${product.summary}',
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        children: [
          Text(product.price.toStringAsFixed(2)),
          Text('$index'),
        ],
      ),
    );
  }

  _buildLeadingImage(String image) {
    final url = 'https://mixcart.com.tr/storage/$image';
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
