import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreenEmpty extends StatefulWidget {
  const MessageScreenEmpty({super.key});

  @override
  State<MessageScreenEmpty> createState() => _MessageScreenEmptyState();
}

class _MessageScreenEmptyState extends State<MessageScreenEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: 330,
                height: 800,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Mensajes',
                              style: GoogleFonts.inter(
                                  fontSize: 25, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                              'assets/icons/Active/TextMessageblue.svg',
                              width: 35,
                              height: 35)
                        ],
                      ),
                      const SizedBox(height: 310),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Text(
                              'No hay mensajes nuevos',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -30, // Ajusta la posición vertical del icono
                            child: SvgPicture.asset(
                              'assets/icons/messconfirm.svg', // Reemplaza esto con la ruta a tu icono SVG
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ],
                      ),
                    ])))));
  }
}
