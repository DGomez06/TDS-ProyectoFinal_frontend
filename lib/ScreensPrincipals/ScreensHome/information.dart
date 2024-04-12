import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/models/products.dart';

class DetailScreen extends StatefulWidget {
  final Properties property;
  final String imageUrl;

  const DetailScreen({Key? key, required this.property, required this.imageUrl})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    String numberformat =  NumberFormat('#,###').format((widget.property.rentalPrice));
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 295,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.property.nombre,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ubicacion: ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.property.direccion,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 38,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xFF26C2E4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: (){}, 
                      child: Center(
                        child: Text(
                          'Disponible',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Precio: ',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'RD\$ $numberformat/mes',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color(0xFFD3D2D2),
                    thickness: 2,
                  ),
                  Text(
                    'Comodidades disponibles',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26C2E4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/bed.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Habitaciones: ${widget.property.numberRooms}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 50,),
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26C2E4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Bathroom.svg',
                          fit: BoxFit.contain,
                        )
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Baños: ${widget.property.numberBathrooms}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Descripcion',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Este encantador apartamento en alquiler se encuentra en una ubicación privilegiada, a solo unos pasos de restaurantes, tiendas y transporte público. Está situado en el barrio céntrico y vibrante de la ciudad, ofreciendo conveniencia y accesibilidad.',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,

                    ),
                      textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Detalles',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('1 television\n2 muebles\n3 estufas', style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 13)),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color(0xFFD3D2D2),
                    thickness: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Mapa de ubicacion',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 270,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/map.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color(0xFFD3D2D2),
                    thickness: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Informacion de contacto',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF26C2E4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text('A', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 23,
                            child: Text(
                              'Marcelo',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            'agachateyconocelo@gmail.com',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26C2E4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Active/mail.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
