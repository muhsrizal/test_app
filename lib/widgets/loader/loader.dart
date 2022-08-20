import 'package:flutter/material.dart';

import '../http/no_internet_message.dart';
import 'loader_state.dart';

/// Manage what to show on screen based on [LoaderState].
class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    required this.state,
    this.onTryAgain,
    required this.child,
  }) : super(key: key);

  /// Define current state.
  final LoaderState state;
  final void Function()? onTryAgain;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case LoaderState.loading:
        return const Center(child: CircularProgressIndicator());
      case LoaderState.noInternet:
        return NoInternetMessage(onTryAgain: onTryAgain);
      case LoaderState.none:
        return child;
      default:
        return const SizedBox();
    }
  }
}
