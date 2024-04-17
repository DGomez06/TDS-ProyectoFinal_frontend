import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Providers/Properties/property.dart';
import 'package:provider/provider.dart';

class CreateProperty extends StatefulWidget {
  const CreateProperty({super.key,});

  @override
  CreatePropertyState createState() => CreatePropertyState();
}

class CreatePropertyState extends State<CreateProperty> {
  int _currentHabitaciones = 1;
    int _currentBanos = 1;
    int _selectedPropertyTypeId = 0;
    TextEditingController _addressController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    TextEditingController _priceController = TextEditingController();
    TextEditingController _dimensionsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.red[200],
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Tipo de propiedad',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPropertyTypeId = 0; // Update state for button 1
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 180,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _selectedPropertyTypeId == 0
                          ? const Color(0xFF26c2e4) 
                          : Colors.grey, 
                          width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: 10,
                          left: 20,
                          child: SvgPicture.asset(
                            'assets/icons/property/househouse.svg',
                            height: 40,
                            color: _selectedPropertyTypeId == 0
                                ? const Color(0xFF26c2e4)
                                : const Color(0xff757575),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        const SizedBox(width: 10),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: 25,
                          left: 80,
                          child: Text(
                            'Casa',
                            style: TextStyle(
                              fontSize: 15,
                              color: _selectedPropertyTypeId == 0
                                  ? const Color(0xFF26c2e4)
                                  : const Color(0xff757575),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            top: 10,
                            right: 10,
                            child: AnimatedContainer(
                              curve: Curves.easeInOutQuad,
                              duration: const Duration(milliseconds: 300),
                              width: _selectedPropertyTypeId == 0 ? 15 : 0,
                              height: _selectedPropertyTypeId == 0 ? 15 : 0,
                              child: SvgPicture.asset(
                                'assets/icons/property/selected.svg',
                                height: 15,
                                alignment: Alignment.topRight,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPropertyTypeId = 1; // Update state for button 1
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 180,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _selectedPropertyTypeId == 1
                          ? const Color(0xFF26c2e4) 
                          : Colors.grey, 
                          width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: 10,
                          left: 20,
                          child: SvgPicture.asset(
                            'assets/icons/property/buildings.svg',
                            height: 40,
                            color: _selectedPropertyTypeId == 1
                                ? const Color(0xFF26c2e4)
                                : const Color(0xff757575),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        const SizedBox(width: 10),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: 25,
                          left: 80,
                          child: Text(
                            'Casa',
                            style: TextStyle(
                              fontSize: 15,
                              color: _selectedPropertyTypeId == 1
                                  ? const Color(0xFF26c2e4)
                                  : const Color(0xff757575),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            top: 10,
                            right: 10,
                            child: AnimatedContainer(
                              curve: Curves.easeInOutQuad,
                              duration: const Duration(milliseconds: 300),
                              width: _selectedPropertyTypeId == 1 ? 15 : 0,
                              height: _selectedPropertyTypeId == 1 ? 15 : 0,
                              child: SvgPicture.asset(
                                'assets/icons/property/selected.svg',
                                height: 15,
                                alignment: Alignment.topRight,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
              ),
            ],
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
                controller: _addressController,
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

              child: TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
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
                controller: _priceController,
                keyboardType: TextInputType.number,
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
                controller: _dimensionsController,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Habitaciones'),
                  const SizedBox(height: 5),
                  Container(
                    width: 170,
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xffD3D2D2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 3,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: _currentHabitaciones,
                        items: <int>[1, 2, 3, 4, 5].map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/property/bed.svg',
                                  height: 15,
                                ),
                                const SizedBox(width: 8),
                                Text('$value', style: GoogleFonts.inter(fontSize: 14)),
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
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Baños'),
                  const SizedBox(height: 5),
                  Container(
                    width: 170,
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xffD3D2D2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 3,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: _currentBanos,
                        items: <int>[1, 2, 3, 4, 5].map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/property/Bathroom.svg',
                                  height: 22,
                                ),
                                const SizedBox(width: 8),
                                Text('$value', style: GoogleFonts.inter(fontSize: 14)),
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
                  ),
                ],
              ),
            ],
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
                  onPressed: () {
                    final propertyData = Provider.of<PropertyData>(context, listen: false);
                    if (_selectedPropertyTypeId.isNaN || _addressController.text.isEmpty || _descriptionController.text.isEmpty || _priceController.text.isEmpty || _dimensionsController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, rellene todos los campos'),
                        ),
                      );
                    } else {
                      propertyData.setGeneral(
                        _selectedPropertyTypeId == 0 ? 'Casa' : 'Apartamento',
                        _addressController.text,
                        _descriptionController.text,
                        double.parse(_priceController.text),
                        _dimensionsController.text,
                        _currentHabitaciones,
                        _currentBanos,
                      );
                      propertyData.setIndex(1);
                    }
                  },
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
