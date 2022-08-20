import 'package:flutter/material.dart';

import 'error_mesage.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ErrorMessage(
      title: "Oops",
      message: "We are sorry, the data you're looking for is not found",
      icon: Icon(Icons.inbox),
    );
  }
}
