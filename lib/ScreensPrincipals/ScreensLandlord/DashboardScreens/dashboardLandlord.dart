import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lease_managment/Providers/Properties/dashboard_provider.dart';
import 'package:lease_managment/Providers/Properties/propertiesProvider.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/DashboardScreens/my_properties.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/DashboardScreens/viewtenant.dart';
import 'package:lease_managment/models/dashboard.dart';
import 'package:provider/provider.dart'; // Import for using SVG icons

class DashboardLandlord extends StatefulWidget {
  const DashboardLandlord({super.key});

  @override
  State<DashboardLandlord> createState() => _DashboardLandlordState();
}

class _DashboardLandlordState extends State<DashboardLandlord> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<DashboardProvider>(builder: (context, value, child) {
      return FutureBuilder(
          future: value.getDashboard(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final dashboard = snapshot.data;
              return BuildDashBoard(dashboard: dashboard);
            }
          });
    }));
  }
}

class BuildDashBoard extends StatefulWidget {
  final Dashboard? dashboard;
  const BuildDashBoard({super.key, required this.dashboard});

  @override
  State<BuildDashBoard> createState() => _BuildDashBoardState();
}

class _BuildDashBoardState extends State<BuildDashBoard>{
  bool isTappedProperties = false;
  bool isTappedTenant = false;
  @override
  Widget build(BuildContext context){
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
        child: Column(
      children: <Widget>[
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              const Text(
                'Tablero',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                'assets/icons/Active/DashBoardBlueFill.svg',
                width: 20,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color(
                    0xFFd3d2d2,
                  ),
                  width: 2),
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 1.0,
                  offset: const Offset(
                      0, 4), // shadow direction: bottom right
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Ingresos totales',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'RD\$${widget.dashboard?.totalIncome ?? 0}', // Replace with actual value
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                          'assets/icons/Dashboard/dollar-circle.svg')
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF26c2e4),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(height: 16),
        Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color(
                    0xFFd3d2d2,
                  ),
                  width: 2),
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 1.0,
                  offset: const Offset(
                      0, 4), // shadow direction: bottom right
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Historial de transacciones',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '12', // Replace with actual value
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                          'assets/icons/Dashboard/cards.svg')
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF26c2e4),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isTappedProperties = true;
                  Future.delayed(
                      const Duration(milliseconds: 200), () {
                    setState(() {
                      isTappedProperties = false;
                    });
                  });
                  Future.delayed(
                      const Duration(milliseconds: 400), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyPropertiesScreen()));
                  });
                });
              },
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: isTappedProperties
                      ? Matrix4.translationValues(0, 10, 0)
                      : Matrix4.translationValues(0, 0, 0),
                  width: 165,
                  height: 205,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(
                          0xFFd3d2d2,
                        ),
                        width: 2.3),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 1.0,
                        offset: const Offset(0,
                            4), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 165,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            const Text(
                              'Total de propiedades',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset(
                              'assets/icons/Dashboard/house-2.svg',
                              width: 70,
                            ),
                            Text(
                              '${widget.dashboard?.totalProperties ?? 0}'
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF26c2e4),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(width: 19),
            GestureDetector(
              onTap: () {
                setState(() {
                  isTappedTenant = true;
                  Future.delayed(
                      const Duration(milliseconds: 200), () {
                    setState(() {
                      isTappedTenant = false;
                    });
                  });
                  Future.delayed(
                      const Duration(milliseconds: 400), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ViewTenant()));
                  });
                });
              },
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: isTappedTenant
                      ? Matrix4.translationValues(0, 10, 0)
                      : Matrix4.translationValues(0, 0, 0),
                  width: 165,
                  height: 205,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color(
                          0xFFd3d2d2,
                        ),
                        width: 2.3),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 1.0,
                        offset: const Offset(0,
                            4), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 165,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            const Text(
                              'Total de inquilinos',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset(
                              'assets/icons/Dashboard/profile-2user.svg',
                              width: 70,
                            ),
                            Text(
                              '${widget.dashboard?.totalTenants ?? 0}', // Replace with actual value
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF26c2e4),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 20),
        // Placeholder for your table of properties
      ],
    ))); 
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoCard(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Icon(icon, size: 50),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
