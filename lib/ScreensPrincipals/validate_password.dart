import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/functionreal.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/home.dart';
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
                    child: SvgPicture.asset('assets/icons/EmailBlue.svg'))),
              const SizedBox(height: 20),
              Text('Verifica tu correo',
                  style: GoogleFonts.yaldevi(
                      fontWeight: FontWeight.bold, fontSize: 25)),
              Text(
                'Introduce el código recibido en el correo ',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return _buildTextField(index);
                }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 380,
                child: TextButton(
                  onPressed: () {
                    // Aquí verificamos el token, por ejemplo, comparándolo con el token recibido en el correo electrónico
                    // Si el token coincide, establecemos tokenVerified en true
                    // Aquí simplemente simularemos la verificación del token al presionar el botón "Verificar"
                    setState(() {
                      tokenVerified = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF26C2E4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text('Verificar',
                    style: GoogleFonts.yaldevi(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
                ),
              ),
              if (tokenVerified) // Mostrar los campos para la nueva contraseña si el token se ha verificado correctamente
                Column(
                  children: [
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
                        controller: newPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: SvgPicture.asset('assets/icons/Lock.svg'),
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
                          icon: SvgPicture.asset('assets/icons/Lock.svg'),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Confirmar nueva contraseña', hintStyle: GoogleFonts.yaldevi(fontWeight: FontWeight.w400, color: const Color(0xFF727272) ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
                SizedBox(
                width: 250,
                child: TextButton(
                  onPressed: () {
                    if(newPassword.text.isNotEmpty && newConfirmPassword.text.isNotEmpty){
                      if(newPassword.text == newConfirmPassword.text){
                        apiConexion.resetPassword(_controllers[0].text + _controllers[1].text + _controllers[2].text + _controllers[3].text + _controllers[4].text, newPassword.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PrincipalScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Las contraseñas no coinciden')));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, introduce una contraseña')));
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF26C2E4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text('Guardar',
                    style: GoogleFonts.yaldevi(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(int index) {
    return Container(
      width: 55,
      height: 50,
      padding: const EdgeInsets.only(left: 20, top: 45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
      child: Center(
        child: TextFormField(
          showCursor: false,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black),
          controller: _controllers[index],
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 1,
          decoration: InputDecoration(
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
          },
          onFieldSubmitted: (value) {
            if (value.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus(); 
            } else if (index < 3) {
              FocusScope.of(context).nextFocus(); 
            }
          },
        ),
      ),
    );
  }
}

