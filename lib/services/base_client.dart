import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:api_arch_boilerplate/services/app_exceptions.dart';
import 'package:http/http.dart' as http;
//will work on this later
// const String baseUrl = '';
// query parameter demo url used later
// var url =
//     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
//

class BaseClient {
  // ignore: constant_identifier_names
  static const int TIME_OUT_DURATION = 20;
  var client = http.Client();
  //Get
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'baerer token',
      'api_key': 'api_key',
    };
    try {
      var response = await client
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotResponsingException(
          'API Not responding in time', uri.toString());
    }
  }

  //Post
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    var headers = {
      'Authorization': 'baerer token',
      'Content-Type': 'applicaton/json',
      'api_key': 'api_key',
    };
    try {
      var response = await client
          .post(uri, body: payload, headers: headers)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotResponsingException(
          'API Not responding in time', uri.toString());
    }
  }

  //put
  Future<dynamic> put(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    var headers = {
      'Authorization': 'baerer token',
      'Content-Type': 'applicaton/json',
      'api_key': 'api_key',
    };
    try {
      var response = await client
          .put(uri, body: payload, headers: headers)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotResponsingException(
          'API Not responding in time', uri.toString());
    }
  }

  //Delete
  Future<dynamic> delete(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'baerer token',
      'api_key': 'api_key',
    };
    try {
      var response = await client
          .delete(uri, headers: headers)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotResponsingException(
          'API Not responding in time', uri.toString());
    }
  }
  //Multipart
  //Others

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var jsonResponse = utf8.decode(response.bodyBytes);
        return jsonResponse;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
