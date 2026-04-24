import 'dart:convert';
import 'package:http/http.dart' as http;

class LinkCheckerService {
  // 👉 Emulator အတွက် (real device သုံးရင် IP ပြောင်း)
  static const String baseUrl = "http://10.0.2.2:8000/scan-url";

  // 👉 Scan URL function
  static Future<Map<String, dynamic>> scanUrl(String url) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "x-api-key": "arkar12345", // Swagger ထဲက key
        },
        body: jsonEncode({
          "url": url,
          "user_id": "flutter_user"
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Connection Failed: $e");
    }
  }
}