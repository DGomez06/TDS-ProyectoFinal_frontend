import 'package:dio/dio.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/models/dashboard.dart';

class Apidashboard {
  Dio dio = Dio();
  String base = 'http://192.168.1.8:8060/api/v1/dashboard';

  Future<Dashboard> getDashboard() async {
    String? token = await ApiConexion().getToken();
    try {
      final response = await dio.get(base,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        Dashboard dashboardList;
        dashboardList = Dashboard.fromJson(data);
        return dashboardList;
      } else {
        throw Exception('Failed to load content');
      }
    } catch (e) {
      throw Exception('Error fetching content: $e');
    }
  }
}
