import 'package:flutter/material.dart';

class KontakKamiItem extends StatelessWidget {
  const KontakKamiItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            subtitle,
            style: textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
