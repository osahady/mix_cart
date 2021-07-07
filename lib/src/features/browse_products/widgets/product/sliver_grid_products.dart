import 'package:flutter/material.dart';
import 'package:mix/src/features/browse_products/bloc/products_bloc.dart';
import 'package:mix/src/features/browse_products/widgets/widgets.dart';

class SliverGridProducts extends StatelessWidget {
  const SliverGridProducts({
    Key? key,
    required this.state,
  }) : super(key: key);
  final BrowseState state;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: .4,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final product = state.products[index];
          return Container(
            alignment: Alignment.center,
            child: ProductCard(product: product, index: index),
          );
        },
        childCount: state.products.length,
      ),
    );
  }
}
