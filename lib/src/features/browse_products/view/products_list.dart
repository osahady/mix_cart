import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/src/features/browse_cats/view/categories_page.dart';
import 'package:mix/src/features/browse_products/bloc/browse_bloc.dart';
import 'package:mix/src/features/browse_products/widgets/widgets.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('عرض المنتجات'),
    );
  }

  Widget _buildPageBody() {
    return Center(
      child: BlocBuilder<BrowseBloc, BrowseState>(
        builder: (context, state) {
          switch (state.status) {
            case BrowseStatus.initial:
              return Text('waiting');

            case BrowseStatus.success:
              return ProductsListView(state: state);

            case BrowseStatus.failure:
              return Text('fail to bring products');
          }
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'الفئات',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoriesPage();
            },
          ),
        );
        break;
      default:
    }

    setState(() {
      _selectedIndex = index;
    });
  }
}
