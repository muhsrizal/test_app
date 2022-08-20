import 'package:flutter/material.dart';

import '../loader/loader.dart';
import '../loader/loader_state.dart';

class LoadingAndNetworkHandler extends StatelessWidget {
  const LoadingAndNetworkHandler({
    Key? key,
    required this.state,
    this.onTryAgain,
    required this.child,
  }) : super(key: key);

  final LoaderState state;
  final void Function()? onTryAgain;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Loader(
      state: state,
      child: child,
    );
  }
}
