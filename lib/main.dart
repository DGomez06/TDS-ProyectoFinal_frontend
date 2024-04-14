import 'package:flutter/material.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/PaymentScreens/pay_collects.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/PaymentScreens/transactions.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/PaymentScreens/transactionsempty.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/about.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/appdetails.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/changepass.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/darkmode.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/darkmode.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/pay_collect.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/personalinfo.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/home.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/message.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createproperty.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/dashboardLandlord.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/homeLandlord.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/profile.dart';
import 'package:lease_managment/ScreensPrincipals/container_signup.dart';
import 'package:lease_managment/ScreensPrincipals/principal_screen.dart';
import 'package:lease_managment/ScreensPrincipals/validate_password.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
    create: (context) => StatusProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: CreateProperty(),
    );
  }
}
