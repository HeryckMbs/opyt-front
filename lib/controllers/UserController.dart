import 'dart:convert';

import 'package:financas_front_1/network/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class UserController {
  static Future<bool> login(String username, String password) async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = '';
      if (!localStorage.containsKey('token')) {
        token = await Network().getAcess(username, password);
      } else {
        token = jsonDecode(localStorage.getString('token')!);
      }

return true;
    } on Exception catch (e) {
      print(e);
    }
    return false;
  }

  static Future<Map<String, dynamic>> register(
      String email, String password, String name,) async {
    var fullUrl = Uri.http(
      dotenv.env['host']!,
      '/signup',
    );
    late Map<String, dynamic> data;
    late Response response;

    try {
      var response = await http.post(fullUrl,
          body:
              jsonEncode({"email": email, "password": password, 'name': name}),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      data = jsonDecode(response.body);
    } on Exception catch (e) {
      print(e);
    }
    return data;
  }
}
