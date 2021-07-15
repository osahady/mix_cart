import 'package:flutter/material.dart';
import 'package:mix/constants.dart';
import 'package:mix/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: TextButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
        ),
      ),
    );
  }
}
