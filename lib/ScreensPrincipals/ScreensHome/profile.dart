import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/category_dialog.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/homeLandlord.dart';
import 'package:lease_managment/ScreensPrincipals/principal_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ApiConexion api = ApiConexion();
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
            const SizedBox(height: 20),
            Row(
              children: [
                Text('Perfil',
                    style: GoogleFonts.roboto(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                const Icon(
                  Icons.person_pin,
                  color: Colors.blue,
                  size: 40,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 85,
                  height: 85,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/psd-gratis/ilustracion-3d-avatar-o-perfil-humano_23-2150671122.jpg'),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Anonimato',
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('anonimato@gmail.com',
                        style: GoogleFonts.inter(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 2),
                    Text('Santo Domuingo, Rep. Dom.',
                        style: GoogleFonts.inter(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Datos personales',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD3D2D2)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Información Personal', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
                              Text('Nombre, Corre, Dirección', style: GoogleFonts.inter( fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black)),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,  color: Color(0xFFD3D2D2)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 1,
                      width: 300,
                      color: const Color(0xFFD3D2D2),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cambio de contraseña', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400)),
                              Text('Modificar', style: GoogleFonts.inter( fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black),),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,  color: Color(0xFFD3D2D2)),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Servicios',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            Container(
              height: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFD3D2D2)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pagos y Cobros', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400)),
                              Text('Metodos de pago', style: GoogleFonts.inter( fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black),),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,  color: Color(0xFFD3D2D2)),
                        ],
                      ),
                    ),
                  const SizedBox(height: 8),
                  Container(
                      height: 1,
                      width: 300,
                      color: const Color(0xFFD3D2D2),
                    ),
                  const SizedBox(height: 8),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreensLandlord())),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Vuelvete Arrendador', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
                                Text('Ponga su propiedad a la venta', style: GoogleFonts.inter( fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black),),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,  color: Color(0xFFD3D2D2)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Preferencias',
                  style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFD3D2D2)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Modo Oscuro', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
                              Text('Activar o Desactivar', style: GoogleFonts.inter( fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black),),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,  color: Color(0xFFD3D2D2)),
                        ],
                      ),
                    ),
                  const SizedBox(height: 8),
                  Container(
                      height: 1,
                      width: 300,
                      color: const Color(0xFFD3D2D2),
                    ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Detalles de la App', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
                            Text('Politica de provacidad - Terminos y condiciones', style: GoogleFonts.inter( fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black),),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,  color: Color(0xFFD3D2D2)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                      height: 1,
                      width: 300,
                      color: const Color(0xFFD3D2D2),
                    ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Acerca de', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,  color: Color(0xFFD3D2D2)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                      height: 1,
                      width: 300,
                      color: const Color(0xFFD3D2D2),
                    ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: const Text('Cerrar Sesion'),
                          content: const Text('¿Estas seguro de cerrar sesion?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                api.logout();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PrincipalScreen()));
                              },
                              child: const Text('Si'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        );
                      });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cerrar Sesion', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red)),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,  color: Color(0xFFD3D2D2)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}


