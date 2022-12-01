// ignore_for_file: flutter_style_todos

import 'package:dio/dio.dart';
import 'package:flutter_fast_start/core/injection/locator.dart';
import 'package:flutter_fast_start/core/network/network_paths.dart';
import 'package:flutter_fast_start/core/network/networt_service.dart';
import 'package:flutter_fast_start/core/utils/snackbar/snackbar_service.dart';

///Dio representation of network service
class DioNetworkService extends NetworkService {
  ///init Constructor
  DioNetworkService() {
    _dio = Dio();
  }

  late Dio _dio;

  @override
  Future<dynamic> execute({
    required NetworkPaths path,
    Map<String, dynamic>? param,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final requestOptions =
          Options(method: path.method.val, headers: headers ??= {});
      if (path.shouldAuthorized) {
        //TODO: FILL OR DELETE THERE IF APP REQUIRES AUTHENTICATION

        // if (locator<AuthenticationService>().isTokenAvailable) {
        //   String token = locator<AuthenticationService>().getToken();
        //   requestOptions.headers!.addAll({'Authorization': 'Bearer $token'});
        // } else {
        //   locator<RouterService>().pushNamedRemoveStack(Routes.authenticate);
        //   throw Exception('Token is not available, please sign-in again');
        // }
      }

      final res = await _dio.request<dynamic>(
        path.url,
        options: requestOptions,
        data: param,
      );

      if (res.data == null) {
        throw Exception('Response null');
      }
      return res.data;
    } on Exception catch (e) {
      var title = '';
      var message = '';

      if (e is DioError) {
        switch (e.type) {
          case DioErrorType.response:
            switch (e.response?.statusCode) {
              case 401:
                //TODO: FILL OR DELETE THERE IF APP REQUIRES AUTHENTICATION
                //title = 'Unauthorized';
                //message = 'Your login is unauthorized. Please login again';
                //locator<RouterService>()
                //    .pushNamedRemoveStack(Routes.authenticate);
                break;
              case 201:
                title = 'Request failed';
                message =
                    e.response?.data.toString() ?? 'No message from server';
                break;
              default:
                title = 'Unexpected Error';
                message = 'Unknown Network Error';
            }

            break;
          // ignore: no_default_cases
          default:
            title = 'Unexpected Error';
            message = e.message;
        }
      } else {
        title = 'Application Error';
        message = e.toString();
      }

      locator<SnackbarService>().showSnackbar(
        type: SnackBarType.error,
        title: title,
        message: message,
      );

      throw Exception(e);
    }
    //return await _dio.post(path.url, queryParameters: param);
  }
}
