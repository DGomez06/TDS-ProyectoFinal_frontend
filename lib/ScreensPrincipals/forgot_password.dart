import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';
import 'package:lease_managment/ScreensPrincipals/validate_password.dart';
import 'package:lease_managment/Widgets/field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  ApiConexion apiConexion = ApiConexion();
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
              Text('Restablecer contraseña', style: GoogleFonts.yaldevi(fontWeight: FontWeight.bold, fontSize: 25)),
              Text('Introduce tu correo para recuperar la contraseña ', style: GoogleFonts.inter(fontWeight: FontWeight.w400, color: Colors.black ),),
              const SizedBox(height: 20,),
              TextFormFieldWidget(
                durationAnimation: const Duration(milliseconds: 4000),
                containerOpacity: 1,
                containerWidth: 340 ,
                controller: emailController,
                icon: 'assets/icons/Email.svg',
                hintText: 'Example@gmail.com',
              ),
            
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                width: 250 ,
                height: 50 ,
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
                      if (emailController.text.isNotEmpty) {
                        apiConexion.forgotPassword(emailController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ValidatePasswordScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, introduce un correo')));
                      }
                      
                    },
                    child: Center(
                      child: Text('Verificar correo',
                        style: GoogleFonts.yaldevi(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}