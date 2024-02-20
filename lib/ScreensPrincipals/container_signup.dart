import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:provider/provider.dart';

class ContainerSignUp extends StatefulWidget {
  const ContainerSignUp({Key? key}) : super(key: key);

  @override
  State<ContainerSignUp> createState() => _ContainerSignUpState();
}

class _ContainerSignUpState extends State<ContainerSignUp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ContainerVisibility>(
        builder: (context, containerVisibility, _) {
          return AnimatedContainer(
            margin: const EdgeInsets.only(top: 10),
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: containerVisibility.hideContainer ? 350 : 0,
            height: containerVisibility.hideContainer ? 450 : 0,
            color: Colors.transparent,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                          border: Border.all(width: 0.5, color: Colors.grey), color: Colors.white,),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.perm_identity,
                                size: 40,
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
                          border: Border.all(width: 0.5, color: Colors.grey), color: Colors.white,),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.perm_identity,
                                size: 40,
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
                          border: Border.all(width: 0.5, color: Colors.grey), color: Colors.white,),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.phone_in_talk_outlined,
                                size: 40,
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
                          border: Border.all(width: 0.5, color: Colors.grey), color: Colors.white,),
                      child: TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.attach_email_outlined,
                                size: 40,
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
                          border: Border.all(width: 0.5, color: Colors.grey), color: Colors.white,),
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
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text('Registro Completado'),
                                );
                              },
                            );
                          },
                          child: Center(
                              child: Text('Registrate',
                                  style: GoogleFonts.yaldevi(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
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
}
