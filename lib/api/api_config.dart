class ApiConfig {
  static String apiBaseUrl = "https://redefinecommerce.net/krms/backend/api";

  //End point
  static String loginUrl = "$apiBaseUrl/login";

  //API header
  static Future<Map<String, String>> getApiHeaders() async {
    // UserModel? user = await AppConfigCache.getUserModel();
    return {
      'Content-Type': 'application/json',
      'accept': '*/*',
      'Authorization':
          'Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3JlZGVmaW5lY29tbWVyY2UubmV0L2tybXMvYmFja2VuZC9hcGkvbG9naW4iLCJpYXQiOjE3NjQyNDQzODEsImV4cCI6MTc2NDI4MDM4MSwibmJmIjoxNzY0MjQ0MzgxLCJqdGkiOiJEbXJQM1pXUkVLa1BDbmFKIiwic3ViIjoiNSIsInBydiI6ImY5MzA3ZWI1ZjI5YzcyYTkwZGJhYWVmMGUyNmYwMjYyZWRlODZmNTUifQ.crZn25gmVx2CmnLNWk9MSa__waF5ULLU59XnHCFPaLk'}',
    };
  }
}

String? errorMessage = "Something went wrong. Please try again later.";
int globalStatusCode = 404;
