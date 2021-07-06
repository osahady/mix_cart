// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mix/src/features/browse_cats/bloc/browse_categories_bloc.dart';

// class CategoriesList extends StatelessWidget {
//   const CategoriesList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: _buildPageBody(),
//     );
//   }

//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       title: Text('عرض الفئات'),
//     );
//   }

//   Widget _buildPageBody() {
//     return Center(
//       child: BlocBuilder<BrowseCategoriesBloc, BrowseCategoriesState>(
//         builder: (context, state) {
//           switch (state.status) {
//             case BrowseCategoriesStatus.initial:
//               return Text('waiting');

//             case BrowseCategoriesStatus.success:
//               return Text('viewing categories here');

//             case BrowseCategoriesStatus.failure:
//               return Text('fail to bring categories');
//           }
//         },
//       ),
//     );
//   }
// }
