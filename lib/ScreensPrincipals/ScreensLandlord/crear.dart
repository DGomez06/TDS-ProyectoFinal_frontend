import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CrearLandlord extends StatefulWidget {
  const CrearLandlord({super.key});

  @override
  State<CrearLandlord> createState() => _CrearLandlordState();
}

class _CrearLandlordState extends State<CrearLandlord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: 330,
                height: 800,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Row(
                        children: [
                          Text('Propiedades',
                              style: GoogleFonts.inter(
                                  fontSize: 25, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 5),
                          SvgPicture.asset('assets/icons/Active/homeadd.svg',
                              width: 35, height: 35)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 350,
                        height: 350,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/Designer_4.png',
                          fit: BoxFit.cover,
                          width: 350,
                          height: 350,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Column(
                        children: [
                          Text(
                            'Crea tu propiedad',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Aquí puedes dar vida a tu próxima vivienda de alquiler de manera fácil y rápida. Desde acogedores apartamentos hasta espaciosas casas, nuestro proceso te guiará paso a paso para crear la propiedad perfecta para alquilar.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                    ])))));
  }
}
