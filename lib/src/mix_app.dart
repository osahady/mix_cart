import 'package:flutter/material.dart';
import 'package:mix/constants.dart';
import 'package:mix/src/routes/routes.dart';
import 'package:mix/src/screens/splash/splash_screen.dart';

class MixApp extends StatelessWidget {
  const MixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Cairo",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: Routes.materialRoute,
    );
  }
}
