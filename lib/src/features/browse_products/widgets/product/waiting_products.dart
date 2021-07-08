import 'package:flutter/material.dart';
import 'package:mix/src/features/browse_products/widgets/product/nice_app_bar.dart';

class WaitingProducts extends StatelessWidget {
  const WaitingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        NiceAppBar(),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: DummyGrid(),
        ),
      ],
    );
  }
}

class DummyGrid extends StatelessWidget {
  const DummyGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: .4,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            child: Container(
              width: 125,
              height: 125,
              color: Colors.black26,
            ),
            color: Colors.black12,
            alignment: Alignment.center,
          );
        },
        childCount: 10,
      ),
    );
  }
}
