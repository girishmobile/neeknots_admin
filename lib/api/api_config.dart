import 'package:neeknots_admin/utility/secure_storage.dart';

class ApiConfig {
  static String apiBaseUrl = "https://redefinecommerce.net/krms/backend/api";

  static String imageBaseUrl =
      "https://redefinecommerce.net/krms/backend/public/upload/";

  //End point
  static String loginUrl = "$apiBaseUrl/login";

  //API header
  static Future<Map<String, String>> getApiHeaders() async {
    final token = await SecureStorage.getToken();

    return {
      'Content-Type': 'application/json',
      'accept': '*/*',
      'Authorization': 'Bearer $token',
    };
  }
}

String? errorMessage = "Something went wrong. Please try again later.";
int globalStatusCode = 404;
