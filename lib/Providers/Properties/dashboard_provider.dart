import 'package:flutter/widgets.dart';
import 'package:lease_managment/Fuctions/Properties/function_dashboard.dart';
import 'package:lease_managment/models/dashboard.dart';

class DashboardProvider extends ChangeNotifier {
  List<Dashboard> dashboard = [];
  int totalIncome = 0;
  int totalProperties = 0;
  int totalTenants = 0;

  Future<List<Dashboard>> getDashboard() async {
    try {
      dashboard = await Apidashboard().getDashboard();
      return dashboard;
    } catch (e) {
      throw Exception('Error fetching dashboard: $e');
    }
  }
}
