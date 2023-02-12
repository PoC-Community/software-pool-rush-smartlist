import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Save the username
Future<void> saveEmail(String username) async {
  final storage = FlutterSecureStorage();
  await storage.write(key: 'username', value: username);
}

// Get the username
Future<String?> getEmail() async {
  final storage = FlutterSecureStorage();
  return await storage.read(key: 'username');
}

// Remove the username
Future<void> removeEmail() async {
  final storage = FlutterSecureStorage();
  await storage.delete(key: 'username');
}
