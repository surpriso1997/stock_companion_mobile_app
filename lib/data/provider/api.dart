import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class Api {}

getRequest(
    {@required url,
    Options options,
    Map<String, dynamic> params,
    bool isRefreshRequest = false}) async {
  Dio _dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
  try {
    var res = await _dio.get(url, options: options, queryParameters: params);
    return res.data;
  } catch (e) {
    handleError(e: e.toString());
  }
}

postRequest(
    {@required url, Options options, Map<String, dynamic> params}) async {
  Dio _dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
  try {
    var res = await _dio.post(url, options: options, queryParameters: params);
    return res.data;
  } catch (e) {
    handleError(e: e.toString());
  }
}

handleError({String e, Map httpResponse, StackTrace stack}) {
  if (e != null) {
    String error = e.toString().toLowerCase();
    if (error.contains('404')) {
      throw Exception404(message: Constants.error_msg_404);
    } else if (error.contains('500')) {
      throw ServerSideException(message: Constants.error_msg_500);
    } else if (error.contains('401')) {
      throw UnAunthicatedException(message: Constants.error_msg_401);
    } else if (error.contains('408')) {
      throw ConnectionTimeOutException(message: Constants.error_msg_408);
    } else if (error.contains('timeout')) {
      throw ConnectionTimeOutException(message: Constants.error_msg_408);
    } else if (error.contains('422')) {
      throw WrongInputException(message: Constants.error_mdg_422);
    } else {
      throw UnknownException(message: Constants.error_error);
    }
  }
}
