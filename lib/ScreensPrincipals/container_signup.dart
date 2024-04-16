// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/Widgets/field.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  TextFormFieldWidget(
                    durationAnimation: const Duration(seconds: 2),
                    containerDuration: containerVisibility.hideContainer ? 2000 : 200,
                    containerOpacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    containerWidth: containerVisibility.hideContainer ? 340 : 0,
                    controller: _nameController,
                    icon: 'assets/icons/User.svg',
                    hintText: 'Nombre',
                ),
                  TextFormFieldWidget(
                    durationAnimation: const Duration(milliseconds: 2500),
                    containerDuration: containerVisibility.hideContainer ? 2000 : 200,
                    containerOpacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    containerWidth: containerVisibility.hideContainer ? 340 : 0,
                    controller: _lastNameController,
                    icon: 'assets/icons/User.svg',
                    hintText: 'Apellido',
                ),
                  TextFormFieldWidget(
                    durationAnimation: const Duration(milliseconds: 3000),
                    containerDuration: containerVisibility.hideContainer ? 2000 : 200,
                    containerOpacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    containerWidth: containerVisibility.hideContainer ? 340 : 0,
                    controller: _phoneController,
                    icon: 'assets/icons/Phone.svg',
                    hintText: 'Telefono',
                ),
                  TextFormFieldWidget(
                    durationAnimation: const Duration(milliseconds: 3500),
                    containerDuration: containerVisibility.hideContainer ? 2000 : 200,
                    containerOpacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    containerWidth: containerVisibility.hideContainer ? 340 : 0,
                    controller: _emailController,
                    icon: 'assets/icons/Correo.svg',
                    hintText: 'Correo',
                ),
                  TextFormFieldWidget(
                    durationAnimation: const Duration(milliseconds: 4000),
                    containerDuration: containerVisibility.hideContainer ? 2000 : 200,
                    containerOpacity: containerVisibility.hideContainer ? 1.0 : 0.0,
                    containerWidth: containerVisibility.hideContainer ? 340 : 0,
                    controller: _passwordController,
                    icon: 'assets/icons/Password.svg',
                    hintText: 'Contraseña',
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
                                      color: Colors.white))),
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
