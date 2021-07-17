import 'package:flutter/material.dart';
import 'package:mix/size_config.dart';
import 'package:mix/src/features/browse_cats/bloc/categories_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_products/widgets/widgets.dart';
import 'package:models/src/category.dart';

class CategoriesListView extends StatefulWidget {
  final CategoriesState state;

  const CategoriesListView({Key? key, required this.state}) : super(key: key);

  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: getProportionateScreenHeight(150),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index >= widget.state.categories.length) return BottomLoader();
            final category = widget.state.categories[index];

            String url = "https://mixcart.com.tr/storage/${category.image}";
            return CategoryCard(url: url, category: category);

            // return Text(
            //   '${category.name}',
            // );
          },
          separatorBuilder: (context, index) => Text('    '),
          itemCount: widget.state.hasReachedMax
              ? widget.state.categories.length
              : widget.state.categories.length + 1,
          controller: _scrollController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CategoriesBloc>().add(CategoryFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
