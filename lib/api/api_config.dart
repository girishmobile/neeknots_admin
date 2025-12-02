import 'package:neeknots_admin/utility/secure_storage.dart';

class ApiConfig {
  static String BaseUrl = "https://redefinecommerce.net/krms/backend/api";

  static String imageBaseUrl =
      "https://redefinecommerce.net/krms/backend/public/upload/";

  //End point
  static String loginUrl = "$BaseUrl/login";
  static String attendanceUrl =
      "$BaseUrl/hikattendance/currentMonthHikAttendanceRecord";
  static String leaveCountDataUrl = "$BaseUrl/leave_application/summary";
  static String leaveBalanceUrl = "$BaseUrl/user_leave/getLeaveByEmp";
  static String upcomingLeaveHolidayUrl = "$BaseUrl/user/getUpcomingBdays";

  static String allHolidays = "$BaseUrl/getHolidayData2025";
  static String employeeLeaveBalance = "$BaseUrl/datatable/getAllUserLeaves";

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
