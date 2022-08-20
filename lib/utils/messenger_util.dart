import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../../theme/palette.dart';

class MessengerUtil {
  /// Show circular loading dialog. to pop this dialog, use `WRouter.pop()`.
  static Future<void> showLoadingDialog() {
    final context = WRouter.navigatorKey.currentContext!;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (contex) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  /// Show alert dialog.
  static Future<void> showAlertDialog({
    required String title,
    required String message,
    String? confirmLabel,
    void Function()? onConfirm,
    String? cancelLabel,
    void Function()? onCancel,
  }) {
    final context = WRouter.navigatorKey.currentContext!;
    return showDialog(
      context: context,
      builder: (contex) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (cancelLabel != null)
            TextButton(
              onPressed: () {
                WRouter.pop();
                onCancel?.call();
              },
              child: Text(cancelLabel),
            ),
          TextButton(
            onPressed: () {
              WRouter.pop();
              onConfirm?.call();
            },
            child: Text(confirmLabel ?? "Ok"),
          ),
        ],
      ),
    );
  }

  /// Show material snackbar.
  static void showSnackbar(String title) {
    final context = WRouter.navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(title)),
    );
  }

  /// Show material error snackbar.
  static void showErrorSnackbar(String title) {
    final context = WRouter.navigatorKey.currentContext!;
    final palette = Palette.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: palette.error,
        content: Text(
          title,
          style: TextStyle(color: palette.onError),
        ),
      ),
    );
  }

  /// Show no internet connection material error snackbar.
  static void showNoInternetSnackbar() {
    showErrorSnackbar("No internet connection");
  }

  /// Parse response body, and show error dialog
  static void showHttpError(String responseBody) {
    final dataMap = json.decode(responseBody);
    final errors = dataMap["errors"];

    if (errors == null) {
      final message = dataMap["message"];
      if (message != null && message is String) {
        MessengerUtil.showAlertDialog(
          title: "Error",
          message: message,
        );

        return;
      }

      final error = dataMap["error"];
      if (error != null && error is String) {
        MessengerUtil.showAlertDialog(
          title: "Error",
          message: error,
        );

        return;
      }

      final data = dataMap["data"];
      if (data != null && data is String) {
        MessengerUtil.showAlertDialog(
          title: "Error",
          message: data,
        );

        return;
      }

      return;
    }

    final List? errorKeys = errors.keys.toList();
    if (errorKeys != null && errorKeys.isNotEmpty) {
      final firstError = errors[errorKeys[0]][0];
      if (firstError != null && firstError is String) {
        MessengerUtil.showAlertDialog(
          title: "Error",
          message: firstError,
        );

        return;
      }
    }

    MessengerUtil.showAlertDialog(
      title: "Error",
      message: "Unknown error, try again later",
    );
  }

  /// Show no unknown error message material snackbar.
  static void showUnknownErrorSnackbar() {
    MessengerUtil.showErrorSnackbar("Unknown error, try again later");
  }
}
