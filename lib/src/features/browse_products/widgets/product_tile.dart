import 'package:flutter/material.dart';
import 'package:models/models.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${product.id}'),
      title: Text('${product.name}'),
      subtitle: Text(
        '${product.summary}',
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(product.price.toStringAsFixed(2)),
    );
  }
}
