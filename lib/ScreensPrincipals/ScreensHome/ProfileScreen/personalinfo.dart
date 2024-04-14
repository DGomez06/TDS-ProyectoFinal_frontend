import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    fontWeight: FontWeight.w300,
                  )),
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
                    fontWeight: FontWeight.w300,
                  )),
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
                    fontWeight: FontWeight.w300,
                  )),
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
                    fontWeight: FontWeight.w300,
                  )),
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
                    fontWeight: FontWeight.w300,
                  )),
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
                onPressed: () {},
                child: Text(
                  'Editar Datos',
                  style: GoogleFonts.yaldevi(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 150),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text('Eliminar Cuenta'),
                      titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                      content: const Text(
                          'Si eliminas tu cuenta todos los datos relacionados a ella seran eliminados de manera permente '),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Aquí puedes colocar la lógica para eliminar la cuenta
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Navigator.pop(
                                                context), // Close dialog on tap
                                            child: SvgPicture.asset(
                                              'assets/icons/ProfileScreen/delete.svg', // Replace with your icon path
                                              height: 30,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                            'Confirmación de eliminar cuenta',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      titleTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors.white,
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Contraseña',
                                                hintStyle: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)), // Eliminar el borde predeterminado
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 12,
                                                  horizontal: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                              height:
                                                  20), // Espacio entre el TextField y el botón
                                          TextButton(
                                            onPressed: () {
                                              // Lógica para el botón de confirmación
                                              Navigator.of(context).pop();
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  Future.delayed(
                                                      const Duration(
                                                          seconds: 5), () {
                                                    Navigator.of(context).pop(
                                                        true); // Cierra el diálogo después de 5 segundos
                                                  });
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    title: const Text(
                                                      'Gracias por ser parte de nuestro servicio',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    // Ajusta el tamaño del diálogo aquí
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/icons/ProfileScreen/happy.svg', // Reemplaza con la ruta de tu icono
                                                          height: 50,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xFFFF0202),
                                                    Color(0xFFa82930),
                                                  ],
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 20),
                                              child: const Text(
                                                'Eliminar',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFFF0202),
                                      Color(0xFFa82930),
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: const Text(
                                  'Eliminar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 10), // Espacio entre los botones
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF08D0FC),
                                      Color(0xFF0daacc),
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Eliminar Cuenta',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
