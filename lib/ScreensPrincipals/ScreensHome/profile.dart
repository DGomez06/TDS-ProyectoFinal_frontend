import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/category_dialog.dart';
import 'package:lease_managment/Fuctions/functionreal.dart';
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
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD3D2D2)),
                ),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      title: Text('Configuracion',
                          style: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      subtitle: Text('Usuario, Edad, Genero, Foto',
                          style: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFD3D2D2),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      indent: 17,
                      endIndent: 30,
                      color: Color(0xFFD3D2D2),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Ocultar',
                          style: GoogleFonts.inter(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      subtitle: Text('Genero, Edad',
                          style: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: Color(0xFFD3D2D2)),
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
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFD3D2D2)),
              ),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: Text('Notificaciones',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                    subtitle: Text('Desactivar o activar',
                        style: GoogleFonts.inter(
                            fontSize: 12, fontWeight: FontWeight.w300)),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFFD3D2D2),
                    ),
                  ),
                  const Divider(
                    height: 0,
                    indent: 17,
                    endIndent: 30,
                    color: Color(0xFFD3D2D2),
                  ),
                  ListTile(
                    dense: true,
                    title: Text(
                      'Agregar Propiedad',
                      style: GoogleFonts.inter(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      'Ponga su propiedad a la venta',
                      style: GoogleFonts.inter(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFD3D2D2)),
                    onTap: () {
                      DialogManager.confirmationProperty(context);
                    },
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
                  ListTile(
                    dense: true,
                    title: Text('Modo Oscuro',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                    subtitle: Text('Activar o Desactivar',
                        style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Colors.black)),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFFD3D2D2),
                    ),
                  ),
                  const Divider(
                    height: 0,
                    indent: 17,
                    endIndent: 30,
                    color: Color(0xFFD3D2D2),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Ayuda',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                    subtitle: Text('Manual de informaciones',
                        style: GoogleFonts.inter(
                            fontSize: 12, fontWeight: FontWeight.w300)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFD3D2D2)),
                  ),
                  const Divider(
                    height: 0,
                    indent: 17,
                    endIndent: 30,
                    color: Color(0xFFD3D2D2),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Detalles de la App',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                    subtitle: Text('Almacenamiento de la Aplicacion',
                        style: GoogleFonts.inter(
                            fontSize: 12, fontWeight: FontWeight.w300)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFD3D2D2)),
                  ),
                  const Divider(
                    height: 0,
                    indent: 17,
                    endIndent: 30,
                    color: Color(0xFFD3D2D2),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Eliminar cuenta',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                    subtitle: Text('Completar el borrado de acceso',
                        style: GoogleFonts.inter(
                            fontSize: 12, fontWeight: FontWeight.w300)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFD3D2D2)),
                  ),
                  const Divider(
                    height: 0,
                    indent: 17,
                    endIndent: 30,
                    color: Color(0xFFD3D2D2),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Cerrar Sesion',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.red)),
                    subtitle: Text('Cerrar sesion de la cuenta',
                        style: GoogleFonts.inter(
                            fontSize: 12, fontWeight: FontWeight.w300)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFD3D2D2)),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}


