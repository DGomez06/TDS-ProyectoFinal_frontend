import 'package:flutter/widgets.dart';
import 'package:lease_managment/Fuctions/Properties/function_dashboard.dart';
import 'package:lease_managment/models/dashboard.dart';

class DashboardProvider extends ChangeNotifier {


  Future<Dashboard> getDashboard() async {
    try {
      final dashboard = await Apidashboard().getDashboard();
      return dashboard;
    } catch (e) {
      throw Exception('Error fetching dashboard: $e');
    }
  }
}
