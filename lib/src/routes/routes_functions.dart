part of 'routes.dart';

MaterialPageRoute splashScreen() {
  return MaterialPageRoute(
    builder: (context) {
      return SplashScreen();
    },
  );
}

MaterialPageRoute productsPage() {
  return MaterialPageRoute(
    builder: (context) {
      return ProductsPage();
    },
  );
}

MaterialPageRoute homePage() {
  return MaterialPageRoute(
    builder: (context) {
      return HomePage();
    },
  );
}
