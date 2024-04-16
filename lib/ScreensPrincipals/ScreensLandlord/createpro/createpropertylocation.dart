import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:lease_managment/Providers/Properties/property.dart';
import 'package:provider/provider.dart';

class CreatePropertyLocation extends StatefulWidget {
  const CreatePropertyLocation({
    super.key,
  });

  @override
  CreatePropertyLocationState createState() => CreatePropertyLocationState();
}

class CreatePropertyLocationState extends State<CreatePropertyLocation> {
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();
  String text =
      'assssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss';
  LatLng _markerPosition = const LatLng(37.7749, -122.4194);

  void _handleMapTap(LatLng tapPosition) {
    setState(() {
      _markerPosition = tapPosition;
      _latitudeController.text = _markerPosition.latitude.toString();
      _longitudeController.text = _markerPosition.longitude.toString();
    });
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
            Container(
                width: 350,
                height: 450,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FlutterMap(
                    options: MapOptions(
                        initialCenter: const LatLng(18.7357, -70.1627),
                        initialZoom: 9.0,
                        onTap: (tabposition, point) {
                          _handleMapTap(point);
                        }),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: _markerPosition,
                            child: SvgPicture.asset(
                              'assets/icons/property/Pin_fill.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
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
                          controller: _latitudeController,
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
                          controller: _longitudeController,
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
                    onPressed: () {
                      final propertyData =
                          Provider.of<PropertyData>(context, listen: false);
                      if (_latitudeController.text.isNotEmpty &&
                          _longitudeController.text.isNotEmpty) {
                        propertyData.setUbication(
                            double.parse(_latitudeController.text),
                            double.parse(_longitudeController.text));
                        propertyData.setIndex(2);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, ingrese la ubicación de la propiedad'),
                          ),
                        );
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
      ),
    );
  }
}
