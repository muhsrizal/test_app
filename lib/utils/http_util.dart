import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:witt/witt.dart';

import 'messenger_util.dart';

class HttpUtil {
  static String? bearerToken;
  static String? authenticationPath;

  static Map<String, String> get _headers => {
        "Authorization": "Bearer $bearerToken",
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

  /// Create raw http GET request.
  static Future<http.Response> getRaw(String url) async {
    return http.get(
      Uri.parse(url),
      headers: _headers,
    );
  }

  /// Create raw http POST request.
  static Future<http.Response> postRaw(String url, String? data) {
    return http.post(
      Uri.parse(url),
      body: data,
      headers: _headers,
    );
  }

  /// Create raw http PUT request.
  static Future<http.Response> putRaw(String url, String? data) {
    return http.put(
      Uri.parse(url),
      body: data,
      headers: _headers,
    );
  }

  /// Create raw http DELETE request.
  static Future<http.Response> deleteRaw(String url) {
    return http.delete(
      Uri.parse(url),
      headers: _headers,
    );
  }

  /// Create http POST request with multipart body.
  static Future<http.StreamedResponse> multiPartPost(
    String url, {
    Map<String, String>? fields,
    List<String>? filePaths,
    String fileFieldName = "file",
  }) async {
    final request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll(_headers);

    if (filePaths != null) {
      for (final path in filePaths) {
        request.files.add(
          await http.MultipartFile.fromPath(fileFieldName, path),
        );
      }
    }

    if (fields != null) {
      request.fields.addAll(fields);
    }

    return request.send();
  }

  /// Check whether status code is in range 200 - 299.
  static bool statusCodeIn200(int statusCode) {
    if (statusCode >= 200 && statusCode <= 299) {
      return true;
    }

    return false;
  }

  /// Create http GET request.
  static Future<void> get({
    required String path,
    // required String data,
    void Function(String data, int statusCode)? onSuccess,
  }) {
    return _getAndDelete(request: () => getRaw(path), onSuccess: onSuccess);
  }

  /// Create http DELETE request.
  static Future<void> delete({
    required String path,
    required String data,
    void Function(String data, int statusCode)? onSuccess,
  }) {
    return _getAndDelete(request: () => deleteRaw(path), onSuccess: onSuccess);
  }

  /// Create http POST request.
  static Future<void> post({
    required String path,
    required String data,
    Future<void> Function(String data, int statusCode)? onSuccess,
    void Function()? onSocketError,
    void Function(Object e)? onUnknownError,
  }) {
    return _postAndPut(
      request: () => postRaw(path, data),
      onSuccess: onSuccess,
      onSocketError: onSocketError,
      onUnknownError: onUnknownError,
    );
  }

  /// Create http PUT request.
  static Future<void> put({
    required String path,
    required String data,
    Future<void> Function(String data, int statusCode)? onSuccess,
    void Function()? onSocketError,
    void Function(Object e)? onUnknownError,
  }) {
    return _postAndPut(
      request: () => putRaw(path, data),
      onSuccess: onSuccess,
      onSocketError: onSocketError,
      onUnknownError: onUnknownError,
    );
  }

  static Future<void> _getAndDelete({
    required Future<http.Response> Function() request,
    void Function(String data, int statusCode)? onSuccess,
  }) async {
    final response = await request.call();
    if (HttpUtil.statusCodeIn200(response.statusCode)) {
      onSuccess?.call(response.body, response.statusCode);
    }

    if (response.statusCode == 401) {
      HttpUtil.bearerToken = null;
      WRouter.pushNamedAndRemoveAll(authenticationPath!);
    }
  }

  static Future<void> _postAndPut({
    required Future<http.Response> Function() request,
    Future<void> Function(String data, int statusCode)? onSuccess,
    void Function()? onSocketError,
    void Function(Object e)? onUnknownError,
  }) async {
    MessengerUtil.showLoadingDialog();
    try {
      final response = await request.call();
      if (HttpUtil.statusCodeIn200(response.statusCode)) {
        await onSuccess?.call(response.body, response.statusCode);

        /// Pop loading dialog
        WRouter.pop();
        return;
      }

      if (response.statusCode == 401) {
        HttpUtil.bearerToken = null;
        WRouter.pushNamedAndRemoveAll(authenticationPath!);

        return;
      }

      /// Pop loading dialog
      WRouter.pop();
      MessengerUtil.showHttpError(response.body);

      return;
    } on SocketException {
      MessengerUtil.showNoInternetSnackbar();
      onSocketError?.call();
    } catch (e) {
      MessengerUtil.showUnknownErrorSnackbar();
      onUnknownError?.call(e);
    }

    // Pop loading dialog.
    WRouter.pop();
  }
}
