import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const BottomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kTitleTextStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        color: kBottomContainerColour,
        margin: const EdgeInsets.all(15.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
