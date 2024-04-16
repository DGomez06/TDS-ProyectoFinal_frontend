import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/message_user/message.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/message_user/message_received.dart';

class ToggleSliderCreateMessage extends StatefulWidget {
  const ToggleSliderCreateMessage({Key? key}) : super(key: key);

  @override
  State<ToggleSliderCreateMessage> createState() =>
      _ToggleSliderCreateMessageState();
}

class _ToggleSliderCreateMessageState extends State<ToggleSliderCreateMessage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 40),
                    child: Text('Mensajes',
                        style: GoogleFonts.inter(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 40,
                    ),
                    child: SvgPicture.asset(
                        'assets/icons/Active/TextMessageblue.svg',
                        width: 35,
                        height: 35),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildToggleButton('Recibido', 0),
                    _buildToggleButton('Enviados', 1),
                  ],
                ),
              ),
              SizedBox(
                height: 700,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: _selectedIndex * 300 * -1,
                      width: 420,
                      child: buildPage(const Message()),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: (1 - _selectedIndex) * 420,
                      width: 420,
                      child: buildPage(const MessageReceived()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, int index) {
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.black,
              fontSize: 15,
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 119,
          height: 1,
          color: _selectedIndex == index ? Colors.blue : Colors.transparent,
        ),
      ],
    );
  }

  Widget buildPage(
    Widget buildPage,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 700,
      width: 420,
      child: buildPage,
    );
  }
}
