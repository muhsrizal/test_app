import 'package:flutter/material.dart';

import '../../../services/user_services.dart';

class BerandaAvatar extends StatelessWidget {
  const BerandaAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        const CircleAvatar(),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UserServices.userModel.fullName,
              style: textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              UserServices.userModel.email,
              style: textTheme.bodyText2,
            ),
          ],
        ),
      ],
    );
  }
}
