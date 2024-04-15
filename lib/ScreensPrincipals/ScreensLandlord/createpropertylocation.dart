import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePropertyLocation extends StatefulWidget {
  const CreatePropertyLocation({Key? key});

  @override
  CreatePropertyLocationState createState() => CreatePropertyLocationState();
}

class CreatePropertyLocationState extends State<CreatePropertyLocation> {
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
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Ublica tu propiedad',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Use a Stack to overlay the button on top of the image
            Stack(
              children: [
                // Expanded to make the image fill the available space
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // Borde circular
                    ),
                    child: Image.asset(
                      'assets/map.jpg',
                      fit:
                          BoxFit.cover, // Ajusta cómo se redimensiona la imagen
                      width: double
                          .infinity, // Hace que la imagen ocupe todo el ancho
                      height: 450, // Establece la altura de la imagen
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
                      backgroundColor:
                          const Color(0xFF26C2E4), // Set button color to blue
                    ),
                    icon: const Icon(Icons.location_on,
                        color: Colors.white), // Add icon to button
                    label: const Text(
                      'UBICAR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
      ),
    );
  }
}
