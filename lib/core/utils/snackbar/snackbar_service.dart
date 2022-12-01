import 'package:flutter/material.dart';
import 'package:flutter_fast_start/core/utils/snackbar/top_snackbar_service.dart';

///An abstraction for snackbar service. It not depends on BuildContext
///You may check [TopSnackBarService]
abstract class SnackbarService {
  ///to show snackbar
  void showSnackbar({
    required SnackBarType type,
    required String title,
    required String message,
  });

  ///We are using it with riverpod's asyncValue type
  Widget showAsyncValueError(Object object, StackTrace trace);
}

///enum for showing snackbar types. In a dependency injection, snackbar service
///should map of them and arrange colors (red for error etc.)
enum SnackBarType {
  ///error
  error,

  ///info
  info,

  ///warning
  warning,

  ///success
  success;
}
