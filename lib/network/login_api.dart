import 'dart:convert';
import 'dart:io';

import 'package:kievit_flutter/model/user_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  final url = Uri.parse('https://be-kievit.smkrus.com/api/login');

  Future<UserModel> postLogin(
      {required String username, required String password}) async {
    final response = await http
        .post(url, body: {'username': username, 'password': password});
    if(response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      throw HttpException('request error code ${response.statusCode}');
    }
  }
}
