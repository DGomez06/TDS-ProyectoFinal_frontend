// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/functionreal.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/models/user.dart';
import 'package:provider/provider.dart';

class ContainerSignUp extends StatefulWidget {
  const ContainerSignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerSignUp> createState() => _ContainerSignUpState();
}

class _ContainerSignUpState extends State<ContainerSignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ApiConexion apiConexion = ApiConexion();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<StatusProvider>(
        builder: (context, containerVisibility, _) {
          return AnimatedContainer(
            margin: const EdgeInsets.only(top: 10),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: containerVisibility.hideContainer ? 350 : 0,
            height: containerVisibility.hideContainer ? 450 : 0,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: Duration(
                        milliseconds:
                            containerVisibility.hideContainer ? 2000 : 200),
                    opacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(left: 30),
                      width: containerVisibility.hideContainer ? 340 : 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(width: 0.5, color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              icon: SvgPicture.asset(
                                'assets/icons/User.svg',
                                height: 30,
                                width: 30,
                              ),
                              border: InputBorder.none,
                              hintText: 'Nombre',
                              hintStyle: GoogleFonts.yaldevi(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(
                        milliseconds:
                            containerVisibility.hideContainer ? 2000 : 200),
                    opacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(left: 30),
                      width: containerVisibility.hideContainer ? 340 : 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(width: 0.5, color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              icon: SvgPicture.asset(
                                'assets/icons/User.svg',
                                height: 30,
                                width: 30,
                              ),
                              border: InputBorder.none,
                              hintText: 'Apellido',
                              hintStyle: GoogleFonts.yaldevi(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(
                        milliseconds:
                            containerVisibility.hideContainer ? 2000 : 200),
                    opacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 3000),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(left: 30),
                      width: containerVisibility.hideContainer ? 340 : 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(width: 0.5, color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                          maxLength: 12,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [PhoneNumberFormatter()],
                          controller: _phoneController,
                          decoration: InputDecoration(
                              counterText: '',
                              icon: SvgPicture.asset(
                                'assets/icons/Phone.svg',
                                height: 30,
                                width: 30,
                              ),
                              border: InputBorder.none,
                              hintText: 'Telefono',
                              hintStyle: GoogleFonts.yaldevi(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(
                        milliseconds:
                            containerVisibility.hideContainer ? 2000 : 200),
                    opacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 3500),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(left: 30),
                      width: containerVisibility.hideContainer ? 340 : 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(width: 0.5, color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (!value.contains('@') || !value.contains('.')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                              icon: SvgPicture.asset(
                                'assets/icons/Correo.svg',
                                height: 30,
                                width: 30,
                              ),
                              border: InputBorder.none,
                              hintText: 'Correo',
                              hintStyle: GoogleFonts.yaldevi(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(
                        milliseconds:
                            containerVisibility.hideContainer ? 2000 : 200),
                    opacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 4000),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(left: 30),
                      width: containerVisibility.hideContainer ? 340 : 0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(width: 0.5, color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              icon: SvgPicture.asset(
                                'assets/icons/Password.svg',
                                height: 30,
                                width: 30,
                              ),
                              border: InputBorder.none,
                              hintText: 'Contraseña',
                              hintStyle: GoogleFonts.yaldevi(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(
                        milliseconds:
                            containerVisibility.hideContainer ? 2000 : 200),
                    opacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      width: containerVisibility.hideContainer ? 250 : 0,
                      height: containerVisibility.hideContainer ? 70 : 0,
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
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: TextButton(
                          onPressed: () {
                            registerUser();
                            
                          },
                          child: Center(
                              child: Text('Registrate',
                                  style: GoogleFonts.yaldevi(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _validateFields() {
    if (_nameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      return 'Por favor, llena todos los campos';
    }
    if (!_emailController.text.contains('@') ||
        !_emailController.text.contains('.')) {
      return 'Por favor, introduce un correo valido';
    }
    return 'Correcto';
  }

  void registerUser() async {
    try {
      if (_validateFields() == "Correcto") {
        final user = User(
          firstName: _nameController.text,
          lastName: _lastNameController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );
        await apiConexion.registerUserAndGetToken(user);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Usuario registrado correctamente')));
        _nameController.clear();
        _lastNameController.clear();
        _phoneController.clear();
        _emailController.clear();
        _passwordController.clear();
      }
      if (_validateFields() == "Por favor, llena todos los campos") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Por favor, llena todos los campos')));
      }
      if (_validateFields() == "Por favor, introduce un correo valido") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Por favor, introduce un correo valido')));
      }
    } catch (e) {
      throw Exception('Error al registrar el usuario: $e');
    }
  }
}
