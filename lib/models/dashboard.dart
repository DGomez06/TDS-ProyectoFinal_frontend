// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
    final double totalIncome;
    final int totalProperties;
    final int totalTenants;

    Dashboard({
        required this.totalIncome,
        required this.totalProperties,
        required this.totalTenants,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        totalIncome: json["totalIncome"].toDouble(),
        totalProperties: json["totalProperties"].toInt(),
        totalTenants: json["totalTenants"].toInt(),

    );

    Map<String, dynamic> toJson() => {
        "totalIncome": totalIncome,
        "totalProperties": totalProperties,
        "totalTenants": totalTenants,
    };
}
