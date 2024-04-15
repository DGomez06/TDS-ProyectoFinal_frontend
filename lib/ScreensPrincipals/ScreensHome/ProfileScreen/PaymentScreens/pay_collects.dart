import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PayCollects extends StatefulWidget {
  const PayCollects({Key? key}) : super(key: key);

  @override
  PayCollectsState createState() => PayCollectsState();
}

class PayCollectsState extends State<PayCollects> {
  bool _isOverlayVisible = false;
  bool _isOverlayCardVisible = false;
  bool _isOverlayCardVisible2 = false;
  String cardNumber = '0000000000000000';

  void _toggleOverlayVisibility() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });
  }

  void _toggleOverlayCardVisibility() {
    setState(() {
      _isOverlayCardVisible = !_isOverlayCardVisible;
    });
  }

  void _toggleOverlayCardVisibility2() {
    setState(() {
      _isOverlayCardVisible2 = !_isOverlayCardVisible2;
      _isOverlayCardVisible = false;
      _isOverlayVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SvgPicture.asset(
                    'assets/icons/ProfileScreen/back.svg',
                    height: 25,
                    alignment: Alignment.topRight,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Métodos de pago ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Descubre nuestro método de pago seguro mientras te embarcas en la búsqueda de tu próxima vivienda.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF2BD9FF),
                          Color(0xFF21A9C7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        _toggleOverlayVisibility();
                      },
                      child: Text(
                        'Añadir método de pago',
                        style: GoogleFonts.yaldevi(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 1),
              ],
            ),
          ),
          GestureDetector(
            onTap: _toggleOverlayVisibility,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isOverlayVisible ? 0.5 : 0,
              curve: Curves.easeInOut,
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: _isOverlayVisible ? 0 : -250,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: _toggleOverlayVisibility,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 220,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ProfileScreen/back.svg',
                          height: 25,
                          alignment: Alignment.topRight,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Añadir método de pago',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Payment/PayPal.svg',
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'PayPal',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: _toggleOverlayCardVisibility,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Payment/card.svg',
                            height: 25,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Tarjeta de crédito o débito',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: _isOverlayCardVisible ? 0 : -470,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: _toggleOverlayCardVisibility,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 450,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                          width: 300,
                          height: 180,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF20D7FF),
                                Color(0xFF275E6A),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 10),
                                const Text(
                                  'Tarjeta de crédito o débito',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/icons/Payment/chip.png',
                                      height: 31,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/Payment/wifi.svg',
                                      height: 35,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: 28,
                                  child: Text(
                                    formatCardNumber(cardNumber),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Text('0000',
                                    style: TextStyle(color: Colors.white)),
                                const SizedBox(height: 6),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Nombre del titular',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('00/00',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFF22d7ff),
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(4, 7),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Codigo de 16 digitos',
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFF22d7ff),
                                width: 2.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(4, 7),
                                ),
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Nombre Titular',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 160,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFF22d7ff),
                                width: 2.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(4, 7),
                                ),
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Mes/Año',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: 350,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF2BD9FF),
                              Color(0xFF21A9C7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              _toggleOverlayCardVisibility2();
                            },
                            child: Text(
                              'Añadir metodo de pago',
                              style: GoogleFonts.yaldevi(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: _isOverlayCardVisible2 ? 0 : -390,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: _toggleOverlayCardVisibility2,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 380,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                        width: 300,
                        height: 180,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF20D7FF),
                              Color(0xFF275E6A),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: double.infinity,
                                height: 35,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 35,
                                      padding: const EdgeInsets.only(right: 4),
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Text('999',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/Payment/wifi.svg',
                                      height: 35,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 7, right: 70),
                                child: Container(
                                  height: 7,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 7, right: 70),
                                child: Container(
                                  height: 7,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 7, right: 70),
                                child: Container(
                                  height: 7,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 15),
                    Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 140),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFF22d7ff),
                          width: 2.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(4, 7),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Mes/Año',
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF2BD9FF),
                            Color(0xFF21A9C7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextButton(
                          onPressed: () {
                            _toggleOverlayCardVisibility2();
                          },
                          child: Text(
                            'Añadir metodo de pago',
                            style: GoogleFonts.yaldevi(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String formatCardNumber(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');

    String formattedNumber = '';

    for (int i = 0; i < cardNumber.length; i += 4) {
      formattedNumber += cardNumber.substring(i, i + 4);

      if (i + 4 < cardNumber.length) {
        formattedNumber += ' ';
      }
    }

    return formattedNumber;
  }
}
