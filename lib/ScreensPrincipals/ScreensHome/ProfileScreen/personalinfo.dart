import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
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
                  'assets/icons/ProfileScreen/userfill.svg',
                  height: 25,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Datos completo',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ProfileScreen/user.svg',
                  height: 25,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Nombre Completo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Nombre Completo',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,)
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ProfileScreen/phone.svg',
                  height: 25,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Número de teléfono',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Número de teléfono',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,)
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ProfileScreen/correo.svg',
                  height: 25,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Correo Electrónico',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Correo Electrónico',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,)
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ProfileScreen/Gender.svg',
                  height: 25,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Genero',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Agregar Genero',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,)
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ProfileScreen/Direction.svg',
                  height: 25,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Dirección',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Agregar Direccion',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,)
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
                  'Editar Datos',
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