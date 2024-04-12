import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageLandlord extends StatefulWidget {
  const MessageLandlord({super.key});

  @override
  State<MessageLandlord> createState() => _MessageLandlordState();
}

class _MessageLandlordState extends State<MessageLandlord> {
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
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Mensajes',
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset('assets/icons/Active/TextMessageblue.svg',
                          width: 35, height: 35),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 320),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      SvgPicture.asset('assets/icons/messconfirm.svg',
                          width: 30, height: 30),
                      const SizedBox(height: 10),
                      Text(
                        'No hay ningun mensaje nuevo',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
