import 'package:flutter/material.dart';
import 'package:mix/src/features/browse_cats/bloc/browse_categories_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_products/widgets/widgets.dart';

class CategoriesListView extends StatefulWidget {
  final BrowseCategoriesState state;

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
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index >= widget.state.categories.length) return BottomLoader();
        final category = widget.state.categories[index];
        // return SizedBox(
        //   height: 100,
        //   child: ListTile(
        //     title: Text('${category.name}'),
        //   ),
        // );
        return Text(' ${category.name}  |  ');
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: widget.state.hasReachedMax
          ? widget.state.categories.length
          : widget.state.categories.length + 1,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<BrowseCategoriesBloc>().add(CategoryFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
