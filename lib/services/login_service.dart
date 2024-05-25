import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/login_model.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/shopping_app.dart';

userLogin(context, String username, String password) async {
  final response = await http.post(
    Uri.parse('https://api.xunli05.com/userLogin/login'),
    body: <String, String>{
      'username': username,
      'password': password,
      'deviceVersion': '0',
      'deviceUserAgent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
      'deviceType': '0',
      'deviceCode': '6b0c5d96-3cfb-49c2-8961-87c8',
    },
  );

  var resDecode = json.decode(utf8.decode(response.bodyBytes));

  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(resDecode['msg'])));

  if (jsonDecode(response.body)['code'] == 0) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ShoppingApp()),
    );
    LoginModel model = loginModelFromJson(response.body);
    Provider.of<CartProvider>(context, listen: false).setLoginData(model);

    return model;
  } else {
    throw Exception('Failed to log in.');
  }
}
