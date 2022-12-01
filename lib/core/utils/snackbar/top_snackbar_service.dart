import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_start/const/globals.dart';
import 'package:flutter_fast_start/core/utils/snackbar/snackbar_service.dart';

// ignore_for_file: flutter_style_todos

///A snackbar services
class TopSnackBarService extends SnackbarService {
  final Map<SnackBarType, ContentType> _match = {
    SnackBarType.info: ContentType.help,
    SnackBarType.success: ContentType.success,
    SnackBarType.warning: ContentType.warning,
    SnackBarType.error: ContentType.failure,
  };

  SnackBar _renderSnackBarWidget({
    required SnackBarType type,
    required String title,
    required String message,
  }) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: _match[type] ?? ContentType.help,
      ),
    );
  }

  @override
  void showSnackbar({
    required SnackBarType type,
    required String title,
    required String message,
  }) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      _renderSnackBarWidget(type: type, title: title, message: message),
    );
  }

  //TODO: MAKE ASYNCVALUE SERVICE AND MIGRATE THIS
  @override
  Widget showAsyncValueError(Object object, StackTrace trace) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      _renderSnackBarWidget(
        type: SnackBarType.error,
        title: 'AsyncValueError',
        message: object.toString(),
      ),
    );
    return const SizedBox.shrink();
  }
}
