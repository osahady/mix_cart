import 'package:flutter/material.dart';
import 'package:mix/src/features/browse_products/view/products_page.dart';
import 'package:mix/src/screens/screens.dart';
part 'routes_functions.dart';

abstract class Routes {
  static MaterialPageRoute materialRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return splashScreen();

      case ProductsPage.routeName:
        return productsPage();

      default:
        return homePage();
    }
  }
}
