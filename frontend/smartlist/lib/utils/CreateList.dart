import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartlist/pages/CurrentScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smartlist/utils/Token.dart';
import 'package:smartlist/utils/Email.dart';

Future<void> CreateNewList(String Title, String Shop, BuildContext context) async {
  final token = await getToken();
  final email = await getEmail();
  final response = await http.post(
    Uri.http('51.159.159.151:3000', '/lists/newlist'),
    headers: {'Authorization': token!, "email": email!},
    body: jsonEncode({'name': Title, 'list': ' ', 'shop': Shop}),
  );

  if (response.statusCode == 200) {
    Navigator.pop(context);
  } else {
    // Handle unsuccessful registration
    throw Exception('Failed to register');
  }
}