import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ProfileScreen/padlock.svg',
                    height: 25,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Cambio de contraseña',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 38,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña actual',
                    hintStyle: GoogleFonts.inter(
                      color: Colors.black,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/ProfileScreen/unlockempty.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: 38,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña nueva',
                    hintStyle: GoogleFonts.inter(
                      color: Colors.black,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/ProfileScreen/unlockempty.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: 38,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Repetir contraseña nueva',
                    hintStyle: GoogleFonts.inter(
                      color: Colors.black,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/ProfileScreen/unlockempty.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
              height: 40,
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
              child: TextButton(
                onPressed: (){}, 
                child: Text(
                  'Cambiar contraseña',
                  style: GoogleFonts.yaldevi(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            )
          ],
        ),
      ),
    );
  }
}