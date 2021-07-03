import 'package:flutter/material.dart';
import 'package:mix/src/features/browse_products/view/view.dart';
import 'package:mix/src/screens/screens.dart';

class MixApp extends StatelessWidget {
  const MixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsPage(),
    );
  }
}
