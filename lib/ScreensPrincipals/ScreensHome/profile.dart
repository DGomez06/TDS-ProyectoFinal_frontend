import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/newproperty.dart';
import 'package:lease_managment/ScreensPrincipals/principal_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
                  padding: const EdgeInsets.all(20),
                  child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(bottom: 0.5, left: 5, right: 5),
            width: 700,
            height: 670,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFc2c2c2), width: 1.2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFc2c2c2),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                              const CircleAvatar(
                radius: 100,
                backgroundImage:
                    NetworkImage('https://img6.arthub.ai/6514e37a-ed2f.webp'),
                              ),
                              const Text(
                'Rodrigo De Jesus',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                'RJesus@gmail.com',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                '829-666-8585: ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                'San Cristobal',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF26C2E4), Color(0x8026C2E4)]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Ajustes',
                          style: GoogleFonts.yaldevi(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))),
                              Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF26C2E4), Color(0x8026C2E4)]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPropertyPage()));
                      },
                      child: Text('Crear Propiedad',
                          style: GoogleFonts.yaldevi(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))),
                              Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF26C2E4), Color(0x8026C2E4)]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PrincipalScreen()));
                      },
                      child: Text('Cerrar Seccion',
                          style: GoogleFonts.yaldevi(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))),
                            ])),
                )),
    );
  }
}
