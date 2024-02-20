import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/home.dart';
import 'package:provider/provider.dart';

class ContainerSignIn extends StatefulWidget {
  const ContainerSignIn({super.key});

  @override
  State<ContainerSignIn> createState() => _ContainerSignInState();
}

class _ContainerSignInState extends State<ContainerSignIn> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ContainerVisibility>(
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
                    AnimatedOpacity(
                      duration: Duration(
                          milliseconds:
                              containerVisibility.hideContainer ? 200 : 2000),
                      opacity: containerVisibility.hideContainer ? 0.0 : 1.0,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        margin: EdgeInsets.only(
                            top: containerVisibility.hideContainer ? 0 : 20),
                        padding: const EdgeInsets.only(left: 30),
                        width: containerVisibility.hideContainer ? 0 : 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(width: 0.5, color: Colors.grey),
                            color: Colors.white),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.perm_identity,
                              size: 40,
                            ),
                            border: InputBorder.none,
                            hintText: 'Nombre de usuario',
                            hintStyle: GoogleFonts.yaldevi(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(
                          milliseconds:
                              containerVisibility.hideContainer ? 200 : 2000),
                      opacity: containerVisibility.hideContainer ? 0.0 : 1.0,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.only(left: 30),
                        width: containerVisibility.hideContainer ? 0 : 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(width: 0.5, color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.lock_outlined,
                                  size: 40,
                                ),
                                border: InputBorder.none,
                                hintText: 'Contraseña',
                                hintStyle: GoogleFonts.yaldevi(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))
                                ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(
                          milliseconds:
                              containerVisibility.hideContainer ? 200 : 2000),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScreenHome(),
                                  ));
                            },
                            child: Center(
                              child: Text('Iniciar Sesion',
                                style: GoogleFonts.yaldevi(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
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
                        child: Text('Olvidaste la contraseña?',
                          style: GoogleFonts.yaldevi(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.underline)),
                  )),
                ),
              ]),
            )),
          );
        },
      ),
    );
  }
}
