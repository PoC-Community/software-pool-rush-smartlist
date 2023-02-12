import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Save the token
Future<void> saveToken(String token) async {
  final storage = FlutterSecureStorage();
  await storage.write(key: 'jwtToken', value: token);
}

// Get the token
Future<String?> getToken() async {
  final storage = FlutterSecureStorage();
  return await storage.read(key: 'jwtToken');
}

// Remove the token
Future<void> removeToken() async {
  final storage = FlutterSecureStorage();
  await storage.delete(key: 'jwtToken');
}
