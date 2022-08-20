import 'package:flutter/material.dart';

class OutlinedBigButton extends StatelessWidget {
  const OutlinedBigButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.primary,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final Color? primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(primary: primary),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
