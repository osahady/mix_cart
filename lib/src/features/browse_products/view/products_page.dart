import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_products/bloc/browse_bloc.dart';
import 'package:mix/src/features/browse_products/view/products_list.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrowseBloc()..add(ProductFetched()),
      child: ProductsList(),
    );
  }
}
