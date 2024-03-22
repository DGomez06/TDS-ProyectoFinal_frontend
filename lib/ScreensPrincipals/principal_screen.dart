import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/container_signin.dart';
import 'package:lease_managment/ScreensPrincipals/container_signup.dart';
import 'package:provider/provider.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {

  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Consumer<StatusProvider>(
            builder: (context, containerVisibility, _) {
          return Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
              ),
              child: Stack(children: [
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  child: SlideInDown(
                      child:
                          const Image(image: AssetImage('assets/Ellipse.png'))),
                ),
                AnimatedPositioned(
                  bottom: 0,
                  right: 0,
                  duration: const Duration(seconds: 1),
                  child: SlideInUp(
                      child: const Image(
                          image: AssetImage('assets/Ellipse-down.png'))),
                ),
                Center(
                  child: SingleChildScrollView(
                    //controller: scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElasticInUp(
                          delay: const Duration(milliseconds: 100),
                          child: AnimatedContainer(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0x2026C2E4),
                                      Color(0xFF26C2E4)
                                    ]),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            duration: const Duration(seconds: 1),
                            child: ElasticInUp(
                              delay: const Duration(milliseconds: 100),
                              child: const Image(
                                image: AssetImage('assets/buildings.png'),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          duration: const Duration(milliseconds: 540),
                          alignment: Alignment.center,
                          curve: Curves.easeInOut,
                          width: containerVisibility.hideContainer ? 170 : 180,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              containerVisibility.hideContainer
                                  ? 'Registro'
                                  : 'Inicio de Sesion',
                              style: GoogleFonts.yaldevi(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              //overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        AnimatedToggleSwitch.size(
                          current: value,
                          values: const [0, 1],
                          style: ToggleStyle(
                            backgroundGradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0x8026C2E4),
                                  Color(0xFF26C2E4),
                                  Color(0x4026C2E4)
                                ]),
                            borderColor: Colors.grey,
                            indicatorColor: const Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 3),
                              )
                            ],
                            indicatorBorder:
                                Border.all(width: 0.8, color: Colors.grey),
                          ),
                          borderWidth: 0.5,
                          height: 60,
                          iconOpacity: 1,
                          selectedIconScale: 1.4,
                          iconAnimationType: AnimationType.onHover,
                          styleAnimationType: AnimationType.onHover,
                          indicatorSize: const Size.fromWidth(150),
                          customIconBuilder: (context, local, global) {
                            final text =
                                ['Iniciar Sesion', 'Registrate'][local.index];
                            return Center(
                              child: Text(text,
                                  style: GoogleFonts.yaldevi(
                                      fontWeight: FontWeight.bold,
                                      color: Color.lerp(Colors.white,
                                          Colors.black, local.animationValue))),
                            );
                          },
                          onChanged: (i) {
                            setState(() {
                              value = i;
                            });
                            Provider.of<StatusProvider>(context, listen: false)
                                .toggleVisibility();
                          },
                        ),
                        const ContainerSignUp(),
                        const ContainerSignIn()
                      ],
                    ),
                  ),
                ),
              ]));
        }));
  }
}
