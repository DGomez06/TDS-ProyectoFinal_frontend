import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart'; // Import for using SVG icons

class DashboardLandlord extends StatefulWidget {
  const DashboardLandlord({super.key});

  @override
  State<DashboardLandlord> createState() => _DashboardLandlordState();
}

class _DashboardLandlordState extends State<DashboardLandlord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 10, height: 30,),
            const Text(
              'Tablero',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10,),
            SvgPicture.asset('assets/icons/Active/DashBoardBlueFill.svg', width: 30, height: 30),

          ],
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Buscar propiedades',
                      labelStyle: const TextStyle(color: Colors.black),
                      hintStyle: const TextStyle(color:  Colors.black),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/icons/Lupa.svg', 
                          fit: BoxFit.contain,
                        ),
                      ), 
                      border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(20.0),
                      ), 
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 165,
                    height: 205,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFd3d2d2, ), width: 2.3),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1.0,
                          offset: const Offset(0, 4), // shadow direction: bottom right
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
                          child: const Column(
                            children: [
                              SizedBox(height: 14,),
                              Text(
                                'Total de propiedades',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.home, size: 50),
                              Text( 
                                '10', 
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    )
                  ),
                  const SizedBox(width: 19),
                  Container(
                    width: 165,
                    height: 205,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFd3d2d2, ), width: 2.3),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1.0,
                          offset: const Offset(0, 4), // shadow direction: bottom right
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
                          child: const Column(
                            children: [
                              SizedBox(height: 14,),
                              Text(
                                'Total de inquilinos',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.person, size: 50),
                              Text(
                                '10', // Replace with actual value
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    )
                  ),
            
                ],
              ),
              const SizedBox(height: 16),
              Container(
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFd3d2d2, ), width: 2),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1.0,
                          offset: const Offset(0, 4), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20,),
                                  Text(
                                    'Ingresos de alquiler',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    '\$13,200', // Replace with actual value
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Icon(Icons.home, size: 50, color: Color(0xFF26c2e4),),
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
                    )
                  ),
              const SizedBox(height: 20),
              Container(
                    width: 350,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFd3d2d2, ), width: 2.3),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1.0,
                          offset: const Offset(0, 4), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 84.85,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Color(0xFF26c2e4),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              child: const Center(child: Text('Property', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold))),
                            ),
                            Container(
                              width: 2.0, 
                              height: 80, 
                              color: const Color(0xFFd3d2d2), 
                              
                            ),
                            Container(
                              width: 84.85,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Color(0xFF26c2e4),
                              ),
                              child: const Center(child: Text('Address', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold))),
                            ),
                            Container(
                              width: 2.0, 
                              height: 80, 
                              color: const Color(0xFFd3d2d2), 
                            ),
                            Container(
                              width: 84.85,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Color(0xFF26c2e4),
                              ),
                              child: const Center(child: Text('Rental Price', textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold))),
                            ),
                            Container(
                              width: 2.0, 
                              height: 80, 
                              color: const Color(0xFFd3d2d2), 
                            ),
                            Container(
                              width: 84.85,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Color(0xFF26c2e4),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: const Center(child: Text('Tenant', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold))),
                            ),
                          ],
                        ),
                        Container(
                          width: 350, 
                          height: 3.0, 
                          color: const Color(0xFFd3d2d2), 
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              children: [
                                
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
              const SizedBox(height: 20),
              const Text(
                'Ingresos de alquiler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                '\$10000', // Replace with actual value
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Placeholder for your table of properties
            ],
                    ),
          ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoCard({super.key, required this.title, required this.value, required this.icon});

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
