import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
class ValidatePasswordScreen extends StatefulWidget {
  const ValidatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ValidatePasswordScreen> createState() => _ValidatePasswordScreenState();
}

class _ValidatePasswordScreenState extends State<ValidatePasswordScreen> {

  late List<TextEditingController> _controllers;

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ValidatePasswordScreen()));
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
              const SizedBox(height: 20),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ValidatePasswordScreen()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text('Reenviar correo',
                      style: GoogleFonts.yaldevi(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black)),
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
      padding: const EdgeInsets.only(left: 19, bottom: 5),
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
          maxLength: null,
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
