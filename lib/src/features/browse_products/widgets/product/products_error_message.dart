import 'package:flutter/material.dart';

class ProductsErrorMessage extends StatelessWidget {
  const ProductsErrorMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('fail to bring products'));
  }
}
