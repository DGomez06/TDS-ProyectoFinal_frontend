import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProperty extends StatefulWidget {
  const CreateProperty({Key? key});

  @override
  CreatePropertyState createState() => CreatePropertyState();
}

class CreatePropertyState extends State<CreateProperty> {
  @override
  Widget build(BuildContext context) {
    int _currentHabitaciones = 1;
    int _currentBanos = 1;
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          SvgPicture.asset(
            'assets/icons/ProfileScreen/back.svg',
            height: 25,
            alignment: Alignment.topRight,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'NUEVA PROPIEDAD',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Column(
            // Wrap the texts in another Column
            children: [
              Row(
                // Use a Row to display texts side-by-side
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text('General'),
                  SizedBox(width: 50), // Add spacing between texts
                  Text('Ubicación'),
                  SizedBox(width: 50), // Add spacing between texts
                  Text('Adicional'),
                ],
              ),
              Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
                thickness: 2,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Tipo de propiedad',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    // Added shadow property
                    elevation: 5.0,
                  ),
                  icon: const Icon(
                    Icons.house_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Casa',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 10), // Add spacing between buttons
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    // Added shadow property
                    elevation: 5.0,
                  ),
                  icon: const Icon(Icons.business_rounded,
                      size: 30, color: Colors.black),
                  label: const Text(
                    'Piso',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Dirección',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              height: 40,
              width: 350, // Altura deseada del TextField
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
                  hintText: 'Ej: Direccion del lugar',

                  prefixIcon:
                      const Icon(Icons.compare_arrows_sharp), // Icono deseado
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12), // Ajusta el espacio interno
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Descripción',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              height: 80, // Reducimos la altura del contenedor
              width: 350, // Ancho deseado del TextField
              decoration: BoxDecoration(
                color: Colors.white, // Color de fondo blanco
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

              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Ej: Detalles del lugar',
                  prefixIcon: Icon(Icons.add_business_sharp), // Icono deseado
                  border: InputBorder.none, // Quitamos el borde del TextField
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Precio',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              height: 40,
              width: 350, // Altura deseada del TextField
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
                  hintText: 'RD\$ 100,000',

                  prefixIcon: const Icon(Icons.money), // Icono deseado
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12), // Ajusta el espacio interno
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Dimensiones',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              height: 40,
              width: 350, // Altura deseada del TextField
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
                  hintText: 'Ej: 25m²',

                  prefixIcon:
                      const Icon(Icons.extension_outlined), // Icono deseado
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12), // Ajusta el espacio interno
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Habitaciones'),
                          const SizedBox(height: 5),
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: DropdownButton<int>(
                              value: _currentHabitaciones,
                              items: <int>[1, 2, 3, 4, 5].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      const Icon(Icons.bed_outlined, size: 20),
                                      const SizedBox(width: 8),
                                      Text('$value'),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  _currentHabitaciones = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Baños'),
                          const SizedBox(height: 5),
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: DropdownButton<int>(
                              value: _currentBanos,
                              items: <int>[1, 2, 3, 4, 5].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      const Icon(Icons.bathtub_outlined,
                                          size: 20),
                                      const SizedBox(width: 8),
                                      Text('$value'),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  _currentBanos = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 40,
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Siguiente',
                    style: GoogleFonts.yaldevi(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
