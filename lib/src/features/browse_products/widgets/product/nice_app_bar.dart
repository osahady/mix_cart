import 'package:flutter/material.dart';

class NiceAppBar extends StatelessWidget {
  const NiceAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('آخر المنتجات'),
        background: FlutterLogo(),
      ),
    );
  }
}
