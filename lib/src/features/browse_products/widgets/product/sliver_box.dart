import 'package:flutter/material.dart';

class SliverBox extends StatelessWidget {
  const SliverBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 30,
        child: Center(
          child: Text('قائمة بأحدث المنتجات'),
        ),
      ),
    );
  }
}
