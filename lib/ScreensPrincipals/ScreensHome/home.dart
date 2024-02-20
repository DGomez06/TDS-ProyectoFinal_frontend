import 'package:flutter/material.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/dashboard.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/fav.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/find.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/message.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/profile.dart';
import 'package:lease_managment/models/products.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Properties> propertiesData = [];



  @override
  void initState() {
    super.initState();
  }


 
  int index = 0;
  final screen = [
    const FindScreen(),
    const FavScreen(),
    const DashboardScreen(),
    const MessageScreen(),
    const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        elevation: 8,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        
        
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoritos',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
            
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mensajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Perfil',
          ),
        ],
      ),
      body: Stack(
        children: [IndexedStack(
          index: index,
          children: screen,
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(height: 1, color: const Color(0xFFc2c2c2),)
        
        )


      ]),
      
    );
  }
}