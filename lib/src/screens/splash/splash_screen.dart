import 'package:flutter/material.dart';
import 'package:mix/size_config.dart';

import 'components/components.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
