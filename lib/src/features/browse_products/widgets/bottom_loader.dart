import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}
