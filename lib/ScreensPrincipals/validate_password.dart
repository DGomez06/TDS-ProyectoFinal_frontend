import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/functionreal.dart';
import 'package:lease_managment/ScreensPrincipals/principal_screen.dart';

class ValidatePasswordScreen extends StatefulWidget {
  const ValidatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ValidatePasswordScreen> createState() => _ValidatePasswordScreenState();
}

class _ValidatePasswordScreenState extends State<ValidatePasswordScreen> {
  late List<TextEditingController> _controllers;
  bool tokenVerified = false; 
  ApiConexion apiConexion = ApiConexion();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newConfirmPassword = TextEditingController();
  bool isPressed = false;


  @override
  void initState() {
    super.initState();
    _controllers = List.generate(5, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SizedBox(
          width: 350,
          height: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Transform.scale(
                    scale: 0.7,
                    child: SvgPicture.asset('assets/icons/EmailBlue.svg'))
                  ),
              const SizedBox(height: 20),
              Text(tokenVerified ? 'Crear nueva Contraseña' : 'Verifica tu token',
                  style: GoogleFonts.yaldevi(
                      fontWeight: FontWeight.bold, fontSize: 25)),
              Text(
                tokenVerified?  'Introduce tu nueva contraseña, deben ser iguales ' : 'Introduce el codigo recibido en el correo ',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: _buildTextField(index));
                }),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                width: tokenVerified ? 0 : 250,
                height: tokenVerified ? 0 : 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)]),
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
                      
                    },
                    child: Center(
                      child: Text('Reenviar token',
                        style: GoogleFonts.yaldevi(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff000000)))),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                width: tokenVerified ? 350 : 0,
                height: tokenVerified ? 350 : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                child: Transform.scale(
                    scale: 0.7,
                    child: SvgPicture.asset('assets/icons/unlock.svg'))
                  ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 320,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(width: 0.5, color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: newPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: SvgPicture.asset('assets/icons/Password.svg'),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Nueva contraseña', hintStyle: GoogleFonts.yaldevi(fontWeight: FontWeight.w400, color: const Color(0xFF727272) ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 320,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(width: 0.5, color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: newConfirmPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: SvgPicture.asset('assets/icons/Password.svg'),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Repetir contraseña', hintStyle: GoogleFonts.yaldevi(fontWeight: FontWeight.w400, color: const Color(0xFF727272) ),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          width: tokenVerified ? 250 : 0,
                          height: tokenVerified ? 50 : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFf44CBE8), Color(0xFF44CBE8)]),
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
                                if(newPassword.text.isNotEmpty && newConfirmPassword.text.isNotEmpty){
                              if(newPassword.text == newConfirmPassword.text){
                                apiConexion.resetPassword(_controllers[0].text + _controllers[1].text + _controllers[2].text + _controllers[3].text + _controllers[4].text, newPassword.text).then((value) {
                                  if(value == 'Contraseña restablecida correctamente'){
                                    _showSuccess(context, isPressed);
                                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PrincipalScreen()));
                                  } else if (value == 'Error al restablecer la contraseña'){
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al restablecer la contraseña')));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al restablecer la contraseña')));
                                  }
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Las contraseñas no coinciden')));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, introduce una contraseña')));
                            }
                              },
                              child: Center(
                                child: Text('Crear Contraseña',
                                  style: GoogleFonts.yaldevi(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xffFFFFFF)))),
                            ),
                          ),
                        ),
                        
                    ],
                  ),
                ),
              )
                
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(int index) {
    return Container(
      width: 49,
      height: 45,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        showCursor: false,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black),
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintStyle: GoogleFonts.yaldevi(fontWeight: FontWeight.w400, color: const Color(0xFF727272)),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 4) {
            FocusScope.of(context).nextFocus(); 
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus(); 
          }
          if (index == 4) {
            Future.delayed(const Duration(milliseconds: 500), () {
              apiConexion.verifyToken(_controllers[0].text + _controllers[1].text + _controllers[2].text + _controllers[3].text + _controllers[4].text).then((value) {
                if(value){
                  setState(() {
                    tokenVerified = true;
                  });
                } else {
                  Fluttertoast.showToast(msg: 'Token incorrecto', );
                }
              });
            });
          }else{
            setState(() {
              tokenVerified = false;
            });
          }
        },
        onFieldSubmitted: (value) {
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus(); 
          } else if (index < 3) {
            FocusScope.of(context).nextFocus(); 
          }
        },
      ),
    );
  }

  _showSuccess(BuildContext context, bool isPressed){
    return showDialog(
      context: context,
      builder: (context) {
          isPressed = true;
        Timer(const Duration(seconds: 2), () { // Replace 3 with your desired duration
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const PrincipalScreen())); // Dismiss the dialog
        });
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: isPressed ? 300 : 50,
            height: isPressed ? 270 : 50,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: Transform.scale(
                          scale: 0.7,
                          child: SvgPicture.asset('assets/icons/shield-tick.svg'))),
                  const SizedBox(height: 20),
                  
                  Text('Contraseña Exitosa!',
                  textAlign: TextAlign.center,
                      style: GoogleFonts.yaldevi(
                          fontWeight: FontWeight.bold, fontSize: 25, )),
                  const SizedBox(height: 20), 

                  Text('Tu contraseña ha sido restablecida correctamente',
                  textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16)),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

