import 'package:flutter/material.dart';

import '../../../../theme/palette.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    Key? key,
    required this.title,
    required this.message,
    this.buttonLabel,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String message;
  final String? buttonLabel;
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: palette.primary.withOpacity(.1),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(size: 40, color: palette.primary),
                ),
                child: icon,
              ),
            ),
            const SizedBox(height: 16),
            Text(title, style: textTheme.bodyText1),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(color: palette.grey),
              textAlign: TextAlign.center,
            ),
            if (onPressed != null) ...[
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(buttonLabel ?? "Try again"),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
