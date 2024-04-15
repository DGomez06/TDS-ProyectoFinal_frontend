import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePropertyPlus extends StatefulWidget {
  const CreatePropertyPlus({Key? key});

  @override
  CreatePropertyPlusState createState() => CreatePropertyPlusState();
}

class CreatePropertyPlusState extends State<CreatePropertyPlus> {
  @override
  Widget build(BuildContext context) {
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
                  indent: 20,
                  endIndent: 5,
                  thickness: 2,
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
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors
                        .grey[200], // Cambia el color del contenedor a azul
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
              height: 300,
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize:
                                    MainAxisSize.min, // Restrict dialog height
                                children: [
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.house_rounded,
                                        color: Colors.blue,
                                        size: 50,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Confirmación',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                      '¿Estás seguro de crear una propiedad?'),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFF08D0FC),
                                              Color(0xFF0daacc),
                                            ],
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 40,
                                            ), // Transparent background
                                            elevation: 0, // No shadow
                                            textStyle: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          child: const Text('Si',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFFFF0202),
                                              Color(0xFFa82930),
                                            ],
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 40,
                                            ), // Transparent background
                                            elevation: 0, // No shadow
                                            textStyle: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Crear Propiedad',
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
      ),
    );
  }
}
