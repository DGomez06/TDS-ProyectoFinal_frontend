import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/dashboard.dart';
import 'package:lease_managment/models/products.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final Properties property;
  final String imageUrl;

  const DetailScreen(
      {super.key, required this.property, required this.imageUrl});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Properties> addedProperties = [];  
  @override
  Widget build(BuildContext context) {
    String numberformat = NumberFormat('#,###').format(widget.property.precioAlquiler);
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        padding: const EdgeInsets.all(20),
        width: 350,
        height: 700,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFc2c2c2), width: 1.2),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFc2c2c2),
                blurRadius: 20,
                offset: Offset(0, 10),
              )
            ]),
        child: Stack(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Nombre: ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: widget.property.nombre,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(
                          text:
                              '\n\n'), // Salto de línea para el espacio deseado

                      const TextSpan(
                        text: 'Precio: ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'RD\$ $numberformat',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(text: '\n\n'),
                      const TextSpan(
                        text: 'Tamaño: ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '${widget.property.tamano}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(text: '\n\n'),
                      const TextSpan(
                        text: 'Dirección: ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: widget.property.direccion,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(text: '\n\n'),
                      const TextSpan(
                        text: 'Cant. Baños: ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: widget.property.cantBanos,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(text: '\n\n'),
                      const TextSpan(
                        text: 'Cant. Habitaciones: ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: widget.property.cantHabitaciones,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(text: '\n\n'),
                      const TextSpan(
                        text: 'Tipo de Propiedad: ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: '${widget.property.tipoDePropiedad}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          )),
                    ],
                  ),
                ),
              ]),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
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
                      Navigator.pop(context);
                    },
                    child: Text('Volver a la lista de propiedades',
                        style: GoogleFonts.yaldevi(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)))),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Container(
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
                    Provider.of<ContainerVisibility>(context, listen: false)
                      .addProperty(widget.property);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                  ),
                );
                    },
                    child: Text('Agregar',
                        style: GoogleFonts.yaldevi(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)))),
          )
        ]),
      )),
    );
  }
}
