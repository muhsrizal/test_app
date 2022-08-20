import 'package:flutter/material.dart';

import '../message/error_mesage.dart';

class NoInternetMessage extends StatelessWidget {
  const NoInternetMessage({
    Key? key,
    this.onTryAgain,
  }) : super(key: key);

  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return ErrorMessage(
      title: "No internet",
      message: "Can't connect to the internet."
          "\nPlease check your internet connection",
      buttonLabel: "Try again",
      icon: const Icon(Icons.wifi_off_outlined),
      onPressed: onTryAgain,
    );
  }
}
