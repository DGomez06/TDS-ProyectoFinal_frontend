import 'package:flutter/material.dart';
import 'package:lease_managment/Providers/Properties/propertiesProvider.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/Providers/Properties/property.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/PaymentScreens/addedmethods.dart';
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
import 'package:lease_managment/ScreensPrincipals/ScreensHome/message_user/createmessege.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/message_user/message.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/message_user/message_received.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/Message_LandLord/createmessagelandlord.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/Message_LandLord/messages.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/crear.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createproperty.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createpropertylocation.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createpropertyplus.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/toggle_slider.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/DashboardScreens/dashboardLandlord.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/editproperty.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/homeLandlord.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/newproperty.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/profile.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/transactionsLandlord.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/viewtenant.dart';
import 'package:lease_managment/ScreensPrincipals/container_signin.dart';
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
    child: ChangeNotifierProvider(
        create: (context) => PropertyData(),
        child: ChangeNotifierProvider(
          create: (context) => PropertyDataProvider(),
          child: const MyApp(),
        )),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PayCollects(),

    );
  }
}
