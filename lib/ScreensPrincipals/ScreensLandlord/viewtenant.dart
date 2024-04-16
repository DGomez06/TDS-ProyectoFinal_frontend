import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTenant extends StatefulWidget {
  const ViewTenant({Key? key});

  @override
  ViewTenantState createState() => ViewTenantState();
}

class ViewTenantState extends State<ViewTenant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SvgPicture.asset(
              'assets/icons/ProfileScreen/back.svg',
              height: 25,
              alignment: Alignment.topRight,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('Total de Inquilinos',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              width: 350, // Set the desired width
              height: 45, // Set the desired height
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar inquilinos',
                  prefixIcon:
                      const Icon(Icons.search), // Icon before the hint text
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Rounded border radius
                  ),
                ),
              ),
            ),
          ),

          //dividionnmmnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn

          Expanded(
              child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 5))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border:
                        Border.all(width: 1.5, color: const Color(0xFFD3D2D2))),
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 700,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                          context); // Cerrar el showModalBottomSheet
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/ProfileScreen/back.svg',
                                      height: 25,
                                    ),
                                  ),
                                  const SizedBox(width: 60),
                                  const Text(
                                    'Datos del Inquilino',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ProfileScreen/user.svg',
                                    height: 25,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'ID de Usuario',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: '723820930',
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
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
                                    hintText: 'Anonimo Portal',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ),
                              const SizedBox(height: 10),
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
                                    hintText: '(809) 833-0324',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ),
                              const SizedBox(height: 10),
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
                                    hintText: 'Anonimato@gmail.com',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ),
                              const SizedBox(height: 10),
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
                                    hintText: 'Masculino',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ),
                              const SizedBox(height: 10),
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
                                    hintText: 'Santo Domingo Villa Mella ',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  contentPadding:
                      const EdgeInsets.only(top: 10, left: 10, bottom: 5),
                  leading: Container(
                    width: 60,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD01515),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    'Anonimato Pujol Martínez ',
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
