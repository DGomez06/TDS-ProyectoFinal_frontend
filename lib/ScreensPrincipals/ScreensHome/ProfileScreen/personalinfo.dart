import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/ScreensPrincipals/principal_screen.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController fullNameController = TextEditingController();
  String firstName = '';
  String lastName = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/icons/ProfileScreen/back.svg',
                height: 25,
                alignment: Alignment.topRight,
              ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ProfileScreen/user.svg',
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'ID de Usuario',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: '723820930',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ProfileScreen/user.svg',
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Nombre Completo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      onChanged: (value){
                        if (value.contains(' ')) {
                          List<String> nameParts = value.split(' ');
                          setState(() {
                            firstName = nameParts[0];
                            lastName = nameParts.sublist(1).join(' ');
                          });
                        } else {
                          setState(() {
                            firstName = value;
                            lastName = ''; // Reiniciar el apellido si no hay espacios
                          });
                        }
                      },
                      controller: fullNameController,
                      decoration: InputDecoration(
                          hintText: 'Nombre Completo',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ProfileScreen/phone.svg',
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Número de teléfono',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          hintText: 'Número de teléfono',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ProfileScreen/correo.svg',
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Correo Electrónico',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Correo Electrónico',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
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
                onPressed: () async{
                  bool response = await ApiConexion().updateData(firstName, lastName, emailController.text, phoneController.text);
                  if (response){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Datos actualizados correctamente'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error al actualizar los datos'),
                      ),
                    );
                  }
                },
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
            const SizedBox(height: 270),
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
                              onPressed: () async {
                                bool response = await ApiConexion().deleteUserData();
                                if (response){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Cuenta eliminada correctamente'),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Error al eliminar la cuenta'),
                                    ),
                                  );
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrincipalScreen()));
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
