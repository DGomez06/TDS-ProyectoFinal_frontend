import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/models/products.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<StatusProvider>(builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                width: 350,
                height: 700,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: const Color(0xFFc2c2c2), width: 1.2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFc2c2c2),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: provider.addedPropertiesList.length,
                  itemBuilder: (context, index) {

                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFc2c2c2)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFc2c2c2),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(provider.propertiesImageList[index]),
                          ),
                          title:
                              Text(provider.addedPropertiesList[index].nombre),
                          subtitle: Text(
                              provider.addedPropertiesList[index].direccion),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            _showDialog(provider.addedPropertiesList[index]);
                          },
                          // Otros detalles de la propiedad
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void _showDialog(Properties property) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Qué desea hacer?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 20),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF26C2E4), Color(0x8026C2E4)]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder:
                      //         (context, animation, secondaryAnimation) {
                      //       return DetailScreen(
                      //         property: property,
                      //         imageUrl: imageUrlProvider.imageUrl,
                      //       );
                      //     },
                      //     transitionsBuilder:
                      //         (context, animation, secondaryAnimation, child) {
                      //       var begin = const Offset(0.0, 1.0);
                      //       var end = Offset.zero;
                      //       var curve = Curves.ease;
                      //       var tween = Tween(begin: begin, end: end)
                      //           .chain(CurveTween(curve: curve));
                      //       var offsetAnimation = animation.drive(tween);
                      //       return SlideTransition(
                      //         position: offsetAnimation,
                      //         child: child,
                      //       );
                      //     },
                      //     transitionDuration: const Duration(milliseconds: 500),
                      //   ),
                      // );
                    },
                    child: Text('Detalles',
                        style: GoogleFonts.yaldevi(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF26C2E4), Color(0x8026C2E4)]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {
                        // Acción para "Contactar"
                      },
                      child: Text('Contactar',
                          style: GoogleFonts.yaldevi(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))),
            ],
          ),
        );
      },
    );
  }
}
