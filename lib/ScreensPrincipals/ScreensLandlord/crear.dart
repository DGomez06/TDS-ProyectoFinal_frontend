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
                      Text('Registrar Propiedad',
                          style: GoogleFonts.inter(
                              fontSize: 25, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 10),
                      SvgPicture.asset('assets/icons/Active/homeblue.svg',
                          width: 35, height: 35)
                    ],
                  ),
                  const SizedBox(height: 10),
                ]
              )
            )
          )
        )
    );
  }
}