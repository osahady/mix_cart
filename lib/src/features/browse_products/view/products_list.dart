import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_products/bloc/products_bloc.dart';
import 'package:mix/src/features/browse_products/widgets/widgets.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: _buildPageBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('عرض المنتجات'),
    );
  }

  Widget _buildPageBody() {
    return BlocBuilder<ProductsBloc, BrowseState>(
      builder: (context, state) {
        switch (state.status) {
          case BrowseStatus.initial:
            return Waiting();

          case BrowseStatus.success:
            return ProductsListView(state: state);

          case BrowseStatus.failure:
            return Text('fail to bring products');
        }
      },
    );
  }
}
