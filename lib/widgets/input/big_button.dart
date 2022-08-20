import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.primary,
    this.onPrimary,
    this.width,
    this.height,
    this.textStyle,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? primary;
  final Color? onPrimary;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primary,
          onPrimary: onPrimary,
          textStyle: textStyle,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
