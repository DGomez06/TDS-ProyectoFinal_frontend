import 'package:dio/dio.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/models/dashboard.dart';

class Apidashboard {
  Dio dio = new Dio();
  String base = 'http://10.0.0.41:8060/api/v1/dashboard';

  Future<List<Dashboard>> getDashboard() async {
    String? token = await ApiConexion().getToken();
    try {
      final response = await dio.get(base,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        List<Dashboard> dashboardList = [];
        dashboardList.add(Dashboard.fromJson(data));
        return dashboardList;
      } else {
        throw Exception('Failed to load content');
      }
    } catch (e) {
      throw Exception('Error fetching content: $e');
    }
  }
}
