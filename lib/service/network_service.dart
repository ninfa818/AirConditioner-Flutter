import 'dart:convert';

import 'package:aircondition/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'load_service.dart';

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
    final response = await http.post((isFullUrl? '' : backend_url) + link,
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