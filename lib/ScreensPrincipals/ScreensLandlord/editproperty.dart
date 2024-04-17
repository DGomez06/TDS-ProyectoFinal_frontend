import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createproperty.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createpropertylocation.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createpropertyplus.dart';

class EditProperty extends StatefulWidget {
  @override
  _EditPropertyState createState() => _EditPropertyState();
}

class _EditPropertyState extends State<EditProperty> {
  String _selectedOption = 'Disponible';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EDITAR PROPIEDAD',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'ID de Usuario que usara la propiedad',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 40,
                width: 300, // Altura deseada del TextField
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Color y opacidad de la sombra
                      spreadRadius: 1, // Radio de dispersión de la sombra
                      blurRadius: 2, // Radio de difuminado de la sombra
                      offset: const Offset(0, 2), // Desplazamiento de la sombra
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ej: 93405934', // Icono deseado
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12), // Ajusta el espacio interno
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Disponibilidad',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: const Color(0xFFD3D2D2)),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(
                          0, 3), // Cambia la posición de la sombra aquí
                    ),
                  ],
                ),
                child: DropdownButton<String>(
                  value: _selectedOption,
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Disponible',
                      child: Text('Disponible'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'No disponible',
                      child: Text('No disponible'),
                    ),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                    });
                  },
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  child: CreateProperty(),
                  height: 700,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    width: 600,
                    height: 85,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  child: CreatePropertyLocation(),
                  height: 700,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    width: 600,
                    height: 75,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  child: CreatePropertyPlus(),
                  height: 700,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.white,
                    height: 100,
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF2BD9FF),
                              Color(0xFF21A9C7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text('Modificar la propiedad '),
                                  titleTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                  content: const Text(
                                      'Estas seguro de modificar los datos de la propiedad ? '),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            // Aquí puedes colocar la lógica para eliminar la cuenta
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF08D0FC),
                                                  Color(0xFF0daacc),
                                                ],
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            child: const Text(
                                              'Editar',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                            width:
                                                10), // Espacio entre los botones
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF08D0FC),
                                                  Color(0xFF0daacc),
                                                ],
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            child: const Text(
                                              'Volver',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Center(
                            child: Text(
                              'Guardar',
                              style: GoogleFonts.yaldevi(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
