import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final TextAlign? align;

  const TextWidget({
    super.key,
    required this.title,
    required this.textStyle,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle,
      textAlign: align,
    );
  }
}
