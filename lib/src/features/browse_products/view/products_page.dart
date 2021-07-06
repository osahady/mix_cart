import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_cats/bloc/browse_categories_bloc.dart';
import 'package:mix/src/features/browse_products/bloc/browse_bloc.dart';
import 'package:mix/src/features/browse_products/view/products_list.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BrowseBloc>(
          create: (BuildContext context) => BrowseBloc()..add(ProductFetched()),
        ),
        BlocProvider<BrowseCategoriesBloc>(
          create: (BuildContext context) =>
              BrowseCategoriesBloc()..add(CategoryFetched()),
        ),
      ],
      child: ProductsList(),
    );
    // return BlocProvider(
    //   create: (_) => BrowseBloc()..add(ProductFetched()),
    //   child: ProductsList(),
    // );
  }
}
