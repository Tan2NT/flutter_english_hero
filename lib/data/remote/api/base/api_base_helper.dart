import 'dart:io';
import 'package:english_hero/core/exception/exception_model.dart';
import 'package:english_hero/di/injection/injetion.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/exception/app_exception.dart';
import 'dart:async';

class ApiBaseHelper {
  Future<dynamic> performRequest(RequestMethod method, Uri url,
      [dynamic body]) async {
    dynamic responseJson;
    try {
      dynamic response;
      switch (method) {
        case RequestMethod.GET:
          response = await http.get(url);
          break;
        case RequestMethod.POST:
          response = await http.post(url, body: body);
          break;
        case RequestMethod.PUT:
          response = await http.put(url, body: body);
          break;
        case RequestMethod.DELETE:
          response = await http.delete(url);
          break;
      }
      responseJson = _returnResponse(response);
    } on SocketException {
      throwError(FetchDataException('No Internet connection'));
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throwError(BadRequestException(response.body.toString()));
        break;
      case 401:
      case 403:
        throwError(UnauthorisedException(response.body.toString()));
        break;
      case 500:
      default:
        throwError(FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}'));
    }
  }

  void throwError(exception) {
    final exceptionModel = getIt.get<ExceptionModel>();
    exceptionModel.setException(exception);
  }
}

enum RequestMethod { GET, POST, PUT, DELETE }
