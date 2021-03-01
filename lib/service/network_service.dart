import 'dart:convert';

import 'package:aircondition/util/constants.dart';
import 'package:aircondition/service/load_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  BuildContext context;

  var backend_url = server_url + 'Backend/';
  var download_url = server_url + 'download/';
  var upload_url = server_url + 'uploads/';

  NetworkService(BuildContext context) {
    this.context = context;
  }

  Future<dynamic> ajax(String link, Map<String, String> parameter, {bool isProgress = false, bool isFullUrl = false}) async {
    print('===== response link ===== \n${(isFullUrl? '' : backend_url) + link}');
    print('===== response params ===== \n${parameter.toString()}');

    if (isProgress) LoadService().showLoading(context);
    final response = await http.post(
      (isFullUrl? '' : backend_url) + link,
      headers: {
        "Access-Control-Allow-Origin": "https://airbackend.laodev.info", // Required for CORS support to work
        "Access-Control-Allow-Methods": "GET,POST,OPTIONS,DELETE,PUT",
        "Cache-Control": "no-store,no-cache,must-revalidate",
        'Content-Type': "application/x-www-form-urlencoded,multipart/form-data,text/plain",
      },
      body: parameter,
    ).timeout(Duration(minutes: 1));
    if (isProgress) LoadService().hideLoading(context);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print('===== $link response ===== \n${response.body}');
      return jsonDecode(response.body);
    } else {
      print(link + ' failed ===> ${response.statusCode}');
      // showSnackbar(context, '服务器或网络错误，请过一段时间再试。', type: SnackBarType.ERROR);
      // GotoNetworkErrorScreen(context);
      Exception(response.statusCode);
    }
  }
}