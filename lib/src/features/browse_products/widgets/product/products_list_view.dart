import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/size_config.dart';
import 'package:mix/src/features/browse_cats/bloc/categories_bloc.dart';
import 'package:mix/src/features/browse_products/bloc/products_bloc.dart';
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
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        CategoryTitle(text: 'الفئات'),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            return SliverToBoxAdapter(
              child: CategoriesListView(state: state),
            );
          },
        ),
        BlocBuilder<ProductsBloc, BrowseState>(
          builder: (context, state) {
            return SliverGridProducts(state: state);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ProductsBloc>().add(ProductFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: getProportionateScreenWidth(18),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
