import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
                      Text('Mensajes',
                          style: GoogleFonts.inter(
                              fontSize: 25, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 10),
                      SvgPicture.asset('assets/icons/Active/TextMessageblue.svg',
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