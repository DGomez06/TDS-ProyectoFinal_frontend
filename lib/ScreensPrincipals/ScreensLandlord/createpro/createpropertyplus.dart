import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lease_managment/Fuctions/Properties/function_register_properties.dart';
import 'package:lease_managment/Providers/Properties/property.dart';
import 'package:provider/provider.dart';

class CreatePropertyPlus extends StatefulWidget {
  const CreatePropertyPlus({Key? key});

  @override
  CreatePropertyPlusState createState() => CreatePropertyPlusState();
}

class CreatePropertyPlusState extends State<CreatePropertyPlus> {
  List<XFile> _images = [];

  Future<void> getImage(ImageSource source) async {
    List<XFile>? pickedFiles = [];
    try {
      pickedFiles = await ImagePicker().pickMultiImage(
        imageQuality: 70,  // Adjust image quality (0 to 100)
        maxWidth: 800,    // Adjust max width for images
        maxHeight: 800,   // Adjust max height for images
      );
    } catch (e) {
      print('Error picking images: $e');
    }

    if (pickedFiles != null) {
      setState(() {
        _images.addAll(pickedFiles!);
      });
    }
  }

  Future<void> takePicture() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 70,  // Adjust image quality (0 to 100)
      maxWidth: 800,    // Adjust max width for images
      maxHeight: 800,   // Adjust max height for images
    );

    if (pickedFile != null) {
      setState(() {
        _images.add(pickedFile);
      });
    }
  }

  void removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galería'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Cámara'),
                onTap: () {
                  takePicture();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: DottedBorder(
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
                  for (var image in _images)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [Image.file(
                          File(image.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                          Positioned(
                        top: -10,
                        right: -10,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            removeImage(_images.indexOf(image));
                          },
                        ),
                      ),
                    ]),
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
                                          onPressed: () async {
                                            final propertyData = Provider.of<PropertyData>(context, listen: false);
                                            dynamic response = await ApiRegister().postRegisterProperty(
                                              propertyData.typeProperty!,
                                              propertyData.address!,
                                              propertyData.description!,
                                              propertyData.price!,
                                              propertyData.dimensions!,
                                              propertyData.rooms!,
                                              propertyData.bathrooms!,
                                              propertyData.latitude!,
                                              propertyData.longitude!,
                                              _images
                                            );

                                              if(response is int){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Propiedad creada con éxito'),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                              Navigator.pop(context);
                                            }else{
                                              ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Error al crear la propiedad'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                            }
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
