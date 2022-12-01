import 'package:flutter_fast_start/core/network/dio_network_service.dart';
import 'package:flutter_fast_start/core/network/network_paths.dart';

///How network service works?
///
///All the urls and methods types stored in [NetworkPaths]
///
///Network services only contains execute method and takes all the params from
///[NetworkPaths] class
///
///[DioNetworkService] is the concrete implementation

// ignore: one_member_abstracts
abstract class NetworkService {
  ///It exetuces network request
  ///Every urls should registered on [NetworkPaths]
  Future<dynamic> execute({
    required NetworkPaths path,
    Map<String, dynamic>? param,
    Map<String, dynamic>? headers,
  });
}
