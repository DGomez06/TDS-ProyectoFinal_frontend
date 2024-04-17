// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/forgot_password.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/home.dart';
import 'package:lease_managment/Widgets/field.dart';
import 'package:provider/provider.dart';

class ContainerSignIn extends StatefulWidget {
  const ContainerSignIn({super.key});

  @override
  State<ContainerSignIn> createState() => _ContainerSignInState();
}

class _ContainerSignInState extends State<ContainerSignIn> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<StatusProvider>(
        builder: (context, containerVisibility, _) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: containerVisibility.hideContainer ? 0 : 350,
              height: containerVisibility.hideContainer ? 0 : 350,
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(children: [
                  TextFormFieldWidget(
                    durationAnimation: const Duration(seconds: 2),
                    containerDuration: containerVisibility.hideContainer ? 200 : 2000,
                    containerOpacity: containerVisibility.hideContainer ? 0.0 : 1.0,
                    containerWidth: containerVisibility.hideContainer ? 0 : 340,
                    margin: EdgeInsets.only(top: containerVisibility.hideContainer ? 0 : 20),
                    padding: const EdgeInsets.only(left: 30),
                    controller: _userController,
                    icon: 'assets/icons/Email.svg',
                    hintText: 'Correo Electronico',
                  ),
                  TextFormFieldWidget(
                    durationAnimation: const Duration(seconds: 3),
                    containerDuration: containerVisibility.hideContainer ? 200 : 2000,
                    containerOpacity: containerVisibility.hideContainer ? 0.0 : 1.0,
                    containerWidth: containerVisibility.hideContainer ? 0 : 340,
                    margin: EdgeInsets.only(top: containerVisibility.hideContainer ? 0 : 20),
                    padding: const EdgeInsets.only(left: 30),
                    controller: _passwordController,
                    icon: 'assets/icons/Password.svg',
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),
                  AnimatedOpacity(
                    duration: Duration( milliseconds: containerVisibility.hideContainer ? 200 : 2000),
                    opacity: containerVisibility.hideContainer ? 0.0 : 1.0,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(top: 30, bottom: 10),
                      width: containerVisibility.hideContainer ? 0 : 250,
                      height: containerVisibility.hideContainer ? 0 : 70,
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
                            login();
                          },
                          child: Center(
                            child: Text('Iniciar Sesion',
                              style: GoogleFonts.yaldevi(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: containerVisibility.hideContainer ? 200 : 2000),
                    opacity: containerVisibility.hideContainer ? 0.0 : 1.0,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPasswordScreen()
                                )
                              );
                            },
                          child: Text('Olvidaste la contraseña?',
                            style: GoogleFonts.yaldevi(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: TextDecoration.underline)
                          ),
                        ),
                      )
                    ),
                  ),
                ]),
              )
            ),
          );
        },
      ),
    );
  }

  void login() async {
    ApiConexion api = ApiConexion();
    if (_userController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, llena todos los campos')));
      return;
    }
    final user = _userController.text;
    final password = _passwordController.text;

    final response = await api.login(user, password);
    if (response == 'Correcto') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Seccion iniciada correctamente')));
      navegar();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos incorrectos')));
    }
  }

  void navegar() {
    Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ScreenHome(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        transitionDuration: const Duration(milliseconds: 1000)
      )
    );
  }
}
