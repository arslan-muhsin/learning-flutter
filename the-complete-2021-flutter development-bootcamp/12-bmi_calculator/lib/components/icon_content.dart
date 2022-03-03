import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final double size;
  final String title;

  const IconContent({
    Key? key,
    required this.icon,
    required this.size,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: size,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: kTitleTextStyle,
        ),
      ],
    );
  }
}
