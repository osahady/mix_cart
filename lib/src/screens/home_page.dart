import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageBody(),
    );
  }

  Widget _buildPageBody() {
    return Center(
      child: Text('home page'),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      title: Text('Mix Cart App'),
    );
  }
}
