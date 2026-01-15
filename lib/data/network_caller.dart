import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/data/url.dart';

class getNetwork {
  final bool isSucces;
  final int statuscode;
  final Map<String, dynamic> ? body;
  final String? error;

  getNetwork({required this.isSucces,
    required this.statuscode,
    this.body,
    this.error});

}

class network_caller {

  static const String _default = 'something went wrong';


  static Future <getNetwork> getrequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      Request(url, null);
      Response response = await get(uri);
      logres(url, response);
      if (response == 200) {
        final decode = jsonDecode(response.body);
        return getNetwork(isSucces: true,
          statuscode: response.statusCode,

        );
      }
      else {
        final decode = jsonDecode(response.body);
        return getNetwork(isSucces: false,
            statuscode: response.statusCode,
            error: decode['data'] ?? _default);
      }
    }
    catch (e) {
      return getNetwork(isSucces: false,
          statuscode: -1,
          error: e.toString());
    }
  }

  static Future <getNetwork> posttrequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Request(url, body);
      Response response = await post(uri,

          headers: {
            'content_type': 'application/json'
          },
          body: jsonEncode(body));
      logres(url, response);


      if (response == 200) {
        final decode = jsonDecode(response.body);
        return getNetwork(isSucces: true,
          statuscode: response.statusCode,

        );
      }
      else {
        final decode = jsonDecode(response.body);
        return getNetwork(isSucces: false,
            statuscode: response.statusCode,
            error: decode['data'] ?? _default);
      }
    }
    catch (e) {
      return getNetwork(isSucces: false,
          statuscode: -1,
          error: e.toString());
    }
  }


  static void Request(String uri, Map<String, dynamic>? body) {
    debugPrint(
        ' \n=================req===========\n'
            'body: $body\n'
            'url: $Urls\n'


    );
  }

  static void logres(String url, Response response) {
    debugPrint(
        ' \n=================res===========\n'
            'body: ${response.body}\n'
            'url: $Urls\n'
            "statuscode: ${response.statusCode}"

    );
  }
}
