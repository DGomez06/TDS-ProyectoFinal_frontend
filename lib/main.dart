import 'package:flutter/material.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/principal_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura que los plugins estén inicializados
  SharedPreferences.getInstance(); // Inicializa SharedPreferences
  runApp(
    ChangeNotifierProvider(
      create: (context) => StatusProvider(),
      child: const MyApp(), // Pasa prefs como argumento a MyApp
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PrincipalScreen(),
    );
  }
}
