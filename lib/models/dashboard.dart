// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
    final double totalIncome;
    final double totalProperties;
    final double totalTenants;

    Dashboard({
        required this.totalIncome,
        required this.totalProperties,
        required this.totalTenants,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        totalIncome: json["totalIncome"].toDouble(),
        totalProperties: json["totalProperties"].toDouble(),
        totalTenants: json["totalTenants"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "totalIncome": totalIncome,
        "totalProperties": totalProperties,
        "totalTenants": totalTenants,
    };
}
