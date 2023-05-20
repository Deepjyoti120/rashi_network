import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Secure {
  static const storage = FlutterSecureStorage();
  static Future setAccessKey(String value) async {
    await storage.write(key: "key", value: value);
  }
}
