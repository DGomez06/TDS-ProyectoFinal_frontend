import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/functionreal.dart';
import 'package:lease_managment/ScreensPrincipals/validate_password.dart';

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
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: SvgPicture.asset('assets/icons/Email.svg'),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Example@gmail.com', hintStyle: GoogleFonts.yaldevi(fontWeight: FontWeight.w400, color: const Color(0xFF727272) ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextButton(
                onPressed: (){
                  if (emailController.text.isNotEmpty) {
                    apiConexion.forgotPassword(emailController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ValidatePasswordScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, introduce un correo')));
                    
                  }
                }, 
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF26C2E4),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text('Verificar Correo', style: GoogleFonts.yaldevi(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white))),
              )
            ],
          ),
        ),
      ),
    );
  }
}