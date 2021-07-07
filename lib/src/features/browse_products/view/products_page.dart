import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_cats/bloc/categories_bloc.dart';
import 'package:mix/src/features/browse_products/bloc/products_bloc.dart';
import 'package:mix/src/features/browse_products/view/products_list.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (BuildContext context) =>
              ProductsBloc()..add(ProductFetched()),
        ),
        BlocProvider<CategoriesBloc>(
          create: (BuildContext context) =>
              CategoriesBloc()..add(CategoryFetched()),
        ),
      ],
      child: ProductsList(),
    );
  }
}
