import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartlist/pages/CurrentScreen.dart';
import 'package:smartlist/pages/LoginScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smartlist/utils/Token.dart';
import 'package:smartlist/utils/Email.dart';

Future<void> register(String email, String password, BuildContext context) async {
  final response = await http.post(
    Uri.http('51.159.159.151:3000', '/register'),
    headers: {'Access-Control-Allow-Origin': '*'},
    body: jsonEncode({'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  } else {
    // Handle unsuccessful registration
    throw Exception('Failed to register');
  }
}


Future<void> login(String email, String password, BuildContext context) async {
  final response = await http.post(
    Uri.http('51.159.159.151:3000', '/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    saveToken(jsonDecode(response.body)['token']);
    saveEmail(email);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CurrentScreen()),
    );
  } else {
    // Handle unsuccessful login
    throw Exception('Failed to login');
  }
}