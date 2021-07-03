import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_products/bloc/browse_bloc.dart';
import 'package:mix/src/features/browse_products/widgets/widgets.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('عرض المنتجات'),
    );
  }

  Widget _buildPageBody() {
    return Center(
      child: BlocBuilder<BrowseBloc, BrowseState>(
        builder: (context, state) {
          switch (state.status) {
            case BrowseStatus.initial:
              return Text('waiting');

            case BrowseStatus.success:
              return ProductsListView(state: state);

            case BrowseStatus.failure:
              return Text('fail to bring products');
          }
        },
      ),
    );
  }
}
