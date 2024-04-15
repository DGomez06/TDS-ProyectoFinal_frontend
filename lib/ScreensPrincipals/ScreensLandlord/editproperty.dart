import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProperty extends StatefulWidget {
  const EditProperty({Key? key});

  @override
  EditPropertyState createState() => EditPropertyState();
}

class EditPropertyState extends State<EditProperty> {
  @override
  Widget build(BuildContext context) {
    int _currentHabitaciones = 1;
    int _currentBanos = 1;
    int _selectedPropertyTypeId = -1;
    String _selectedOption = 'Disponible';
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
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'DATOS DE LA PROPIEDAD',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
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
                  hintText: 'Ej: 93405934', // Icono deseado
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12), // Ajusta el espacio interno
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
              width: 350,
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
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Tipo de Propiedad',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedPropertyTypeId = 0; // Update state for button 1
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: _selectedPropertyTypeId == 0
                          ? Colors.blue // Borde azul si está seleccionado
                          : Colors.grey, // Borde gris si no está seleccionado
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 33,
                    ),
                    elevation: 5.0,
                  ),
                  icon: Icon(
                    Icons.house_rounded,
                    size: 30,
                    color: _selectedPropertyTypeId == 0
                        ? Colors.blue // Icono azul si está seleccionado
                        : Colors.black, // Icono negro si no está seleccionado
                  ),
                  label: Text(
                    'Casa',
                    style: TextStyle(
                      fontSize: 18,
                      color: _selectedPropertyTypeId == 0
                          ? Colors.blue // Texto azul si está seleccionado
                          : Colors.black, // Texto negro si no está seleccionado
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Add spacing between buttons
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedPropertyTypeId = 1; // Update state for button 2
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: _selectedPropertyTypeId == 1
                          ? Colors.blue // Borde azul si está seleccionado
                          : Colors.grey, // Borde gris si no está seleccionado
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 33,
                    ),
                    elevation: 5.0,
                  ),
                  icon: Icon(
                    Icons.business_rounded,
                    size: 30,
                    color: _selectedPropertyTypeId == 1
                        ? Colors.blue // Icono azul si está seleccionado
                        : Colors.black, // Icono negro si no está seleccionado
                  ),
                  label: Text(
                    'Piso',
                    style: TextStyle(
                      fontSize: 18,
                      color: _selectedPropertyTypeId == 1
                          ? Colors.blue // Texto azul si está seleccionado
                          : Colors.black, // Texto negro si no está seleccionado
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
            padding: const EdgeInsets.only(left: 20),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
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
            padding: const EdgeInsets.only(left: 20),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
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
            padding: const EdgeInsets.only(left: 20),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
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
            padding: const EdgeInsets.only(left: 20),
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
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Habitaciones',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                          const Text(
                            'Baños',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
          const SizedBox(height: 15),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Ublica tu propiedad',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Borde circular
                  ),
                  child: Image.asset(
                    'assets/map.jpg',
                    fit: BoxFit.cover, // Ajusta cómo se redimensiona la imagen
                    width: double
                        .infinity, // Hace que la imagen ocupe todo el ancho
                    height: 200, // Establece la altura de la imagen
                  ),
                ),
              ),

              // Positioned to align the button to the bottom right corner
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF26C2E4),
                  ),
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 15,
                  ),
                  label: const Text(
                    'UBICAR',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Center(
                    child: Text(
                      'Latitud',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Ej: 12.656595',
                          hintStyle: TextStyle(fontSize: 15),
                          prefixIcon: Icon(
                            Icons.location_on,
                            size: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15, // Adjust vertical size here
                            horizontal: 20, // Adjust horizontal size here
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ListTile(
                  title: const Center(
                    child: Text(
                      'Longitud',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Ej: 12.656595',
                          hintStyle: TextStyle(fontSize: 15),
                          prefixIcon: Icon(
                            Icons.location_on,
                            size: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15, // Adjust vertical size here
                            horizontal: 20, // Adjust horizontal size here
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          DottedBorder(
            color: Colors.black,
            strokeWidth: 2,
            dashPattern: const [5, 5],
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: 350,
                height: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:
                      Colors.grey[200], // Cambia el color del contenedor a azul
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/icons/camera.svg',
                      height: 70,
                    ),
                    const Text(
                      'Subir Imagen',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors
                            .grey, // Hace que el color del texto esté desvanecido
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Imágenes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 350,
            height: 120,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                // Add images using AssetImage or NetworkImage
                Image.asset(
                  'assets/map.jpg',
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
                Image.asset(
                  'assets/map.jpg',
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
                Image.asset(
                  'assets/map.jpg',
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFF0202),
                        Color(0xFFa82930),
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
                  child: TextButton(
                    onPressed: () {
                      // Lógica para eliminar
                    },
                    child: Text(
                      'Eliminar',
                      style: GoogleFonts.yaldevi(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Espacio entre los botones
                Container(
                  height: 40,
                  width: 150,
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
                  child: TextButton(
                    onPressed: () {
                      // Lógica para tu botón normal
                    },
                    child: Text(
                      'Actualizar',
                      style: GoogleFonts.yaldevi(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }
}
