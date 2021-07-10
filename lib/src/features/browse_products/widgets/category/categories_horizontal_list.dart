import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_cats/bloc/categories_bloc.dart';
import 'package:mix/src/features/browse_products/widgets/product/product.dart';
import 'package:mix/src/features/browse_products/widgets/waiting.dart';

class CategoriesHorizontalList extends StatelessWidget {
  const CategoriesHorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 250,
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            switch (state.status) {
              case BrowseCategoriesStatus.initial:
                return Waiting();

              case BrowseCategoriesStatus.success:
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return Column(
                        children: [
                          Text('${category.name} '),
                          Container(
                            width: 200,
                            child: ItemImage(
                                url:
                                    "https://mixcart.com.tr/storage/${category.image}"),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Text(' '),
                    itemCount: 10,
                  ),
                );
              case BrowseCategoriesStatus.failure:
                return Text('تعذر جلب الفئات');
            }
          },
        ),
      ),
    );
  }
}
