import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_cats/bloc/browse_categories_bloc.dart';
import 'package:mix/src/features/browse_products/bloc/browse_bloc.dart';
import 'package:mix/src/features/browse_products/widgets/widgets.dart';

class ProductsListView extends StatefulWidget {
  final BrowseState state;

  const ProductsListView({Key? key, required this.state}) : super(key: key);

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index >= widget.state.products.length) return BottomLoader();
        final product = widget.state.products[index];
        if (index == 0) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<BrowseCategoriesBloc, BrowseCategoriesState>(
                builder: (context, state) {
                  switch (state.status) {
                    case BrowseCategoriesStatus.initial:
                      return Waiting();
                    case BrowseCategoriesStatus.success:
                      // return _buildCats();

                      // return Text('bringing cats');

                      return SizedBox(
                        height: 100,
                        child: BlocBuilder<BrowseCategoriesBloc,
                            BrowseCategoriesState>(
                          builder: (context, state) {
                            return CategoriesListView(state: state);
                          },
                        ),
                      );

                    case BrowseCategoriesStatus.failure:
                      return Text('فشل جلب الفئات');
                  }
                },
              ),
              ProductTile(product: product, index: index + 1),
            ],
          );
        }
        return ProductTile(
          product: product,
          index: index + 1,
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: widget.state.hasReachedMax
          ? widget.state.products.length
          : widget.state.products.length + 1,
      controller: _scrollController,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<BrowseBloc>().add(ProductFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Widget _buildCats() {
    return SizedBox(
      height: 100,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,

        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
