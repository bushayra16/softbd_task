import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_softbd/model.dart';

class Helper {
  static Future<String> fetch(
      {required BuildContext context,
      String? type,
      String? uri,
      String? method,
      String? body}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    http.Response response;
    Uri url = Uri.parse(uri!);

    print(url);
    print(method);
    print(body);

    if (method == 'POST') {
      response = await http.post(url, headers: headers, body: body);
    } else if (method == 'PUT') {
      response = await http.put(url, headers: headers, body: body);
    } else if (method == 'DELETE') {
      response = await http.delete(url, headers: headers);
    } else {
      response = await http.get(url, headers: headers);
    }
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 500){
      return '';
    } else {
      return '';
    }
  }

  static getItems(String body) {
    if (body.isEmpty) return;
  
    Map<String, dynamic> response = json.decode(body);
   
    List<dynamic> items = response['data'];
    List<Schedule> result = <Schedule>[];

    for (Map<String, dynamic> item in items) {
      result.add(Schedule.fromJson(item));
    }
    return result;
  }
}