import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class PayCollects extends StatefulWidget {
  const PayCollects({Key? key}) : super(key: key);

  @override
  PayCollectsState createState() => PayCollectsState();
}

class PayCollectsState extends State<PayCollects> {
  bool _isOverlayVisible = false;
  bool _isOverlayCardVisible = false;
  bool _isOverlayCardVisible2 = false;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();
  TextEditingController cardCodeController = TextEditingController();
  String formattedCardNumber = '0000 0000 0000 0000';
  String formattedCardName = 'Nombre del Titular';
  String formattedCardDate = '00/00';
  String formattedCardCode = '000';
  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(updateFormattedCardNumber);
    cardNameController.addListener(() {
      setState(() {
        formattedCardName = cardNameController.text;
      });
    });
    cardDateController.addListener(() {
      setState(() {
        formattedCardDate = cardDateController.text;
      });
    });
    cardCodeController.addListener(() {
      setState(() {
        formattedCardCode = cardCodeController.text;
      });
    });
  }

  @override
  void dispose() {
    cardNumberController.removeListener(updateFormattedCardNumber);

    cardNumberController.dispose();
    cardNameController.dispose();
    cardDateController.dispose();
    cardCodeController.dispose();
    super.dispose();
  }

  void updateFormattedCardNumber() {
    final String enteredText =
        cardNumberController.text.replaceAll(RegExp(r'[^0-9]'), '');
    List<String> initialChars = formattedCardNumber.split('');
    int charIndex = 0;
    for (int i = 0;
        i < enteredText.length && charIndex < initialChars.length;
        i++) {
      if (i > 0 && i % 4 == 0) {
        charIndex++;
      }
      initialChars[charIndex] = enteredText[i];
      charIndex++;
    }

    setState(() {
      formattedCardNumber = initialChars.join('');
    });
  }

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
    });
  }

  void _toggleOverlayCardVisibility3() {
    setState(() {
      _isOverlayVisible = false;
      _isOverlayCardVisible2 = !_isOverlayCardVisible2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isOverlayVisible ? 0.6 : 1,
              curve: Curves.easeInOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                color: _isOverlayVisible ? Colors.grey : Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/ProfileScreen/back.svg',
                          height: 25,
                          alignment: Alignment.topRight,
                        ),
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
            ),
          ),
          // GestureDetector(
          //   onTap: _toggleOverlayVisibility,
          //   child: AnimatedOpacity(
          //     duration: const Duration(milliseconds: 300),
          //     opacity: _isOverlayVisible ? 0.5 : 0,
          //     curve: Curves.easeInOut,
          //     child: Container(
          //       color: Colors.black,
          //       width: MediaQuery.of(context).size.width,
          //       height: MediaQuery.of(context).size.height,
          //     ),
          //   ),
          // ),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => PaypalCheckout(
                                sandboxMode: true,
                                clientId:
                                    "AYM5RUgBd9U4IzFjQuzpatRLTKsgMo6JRwyf2pCzYQ6LBrNxZn4qEm0iG7m_U-LzSv8x5Kz8J6U8pX_G",
                                secretKey:
                                    "EOQCwuD5xO5QdECc5Z9o_edzYPpZaVF-FZn1C7aDnM_fdVkXm9FHpjSCtqrQppX0r_oEZlmBlgJNsII1",
                                returnURL: "https://www.sandbox.paypal.com",
                                cancelURL: "https://www.sandbox.paypal.com",
                                transactions: const [
                                  {
                                    "amount": {
                                      "total": '70',
                                      "currency": "USD",
                                      "details": {
                                        "subtotal": '70',
                                        "shipping": '0',
                                        "shipping_discount": 0
                                      }
                                    },
                                    "description":
                                        "The payment transaction description.",
                                    // "payment_options": {
                                    //   "allowed_payment_method":
                                    //       "INSTANT_FUNDING_SOURCE"
                                    // },
                                    "item_list": {
                                      "items": [
                                        {
                                          "name": "Apple",
                                          "quantity": 4,
                                          "price": '5',
                                          "currency": "USD"
                                        },
                                        {
                                          "name": "Pineapple",
                                          "quantity": 5,
                                          "price": '10',
                                          "currency": "USD"
                                        }
                                      ],
                                    },
                                    "note_to_payer":
                                        "Pago mensual del alquiler.",
                                  }
                                ],
                                note:
                                    "Contact us for any questions on your order.",
                                onSuccess: (Map params) async {
                                  // Maneja el pago exitoso
                                  print("onSuccess: $params");
                                },
                                onError: (error) {
                                  // Maneja el error de pago
                                  print("onError: $error");
                                },
                                onCancel: () {
                                  // Maneja la cancelación del pago
                                  print('cancelled:');
                                },
                              ),
                            ));
                          },
                          child: Row(
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
                                    formattedCardNumber,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(formattedCardName,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(formattedCardDate,
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
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CardNumberFormatter(),
                            LengthLimitingTextInputFormatter(19)
                          ],
                          decoration: InputDecoration(
                              counterText: '',
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
                              controller: cardNameController,
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
                              controller: cardDateController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Mes/Año',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                  border: InputBorder.none),
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(5), _MonthYearInputFormatter()],
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
                                      child: Text(formattedCardCode,
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
                        keyboardType: TextInputType.number,
                        controller: cardCodeController,
                        decoration: InputDecoration(
                            hintText: 'Mes/Año',
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                            border: InputBorder.none),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)],
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
                            _toggleOverlayCardVisibility3();
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

  // String formatCardNumber(String cardNumber) {
  //   String formattedNumber = '';
  //   for (int i = 0; i < cardNumber.length; i += 4) {
  //     formattedNumber += cardNumber.substring(i, i + 4);
  //     if (i + 4 < cardNumber.length) {
  //       formattedNumber += ' ';
  //     }
  //   }
  //   return formattedNumber;
  // }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer newText = StringBuffer();
    final String formattedText =
        newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (formattedText.isNotEmpty) {
      // Formatear los primeros 16 caracteres con espacios cada 4 caracteres
      for (int i = 0; i < formattedText.length; i++) {
        if (i > 0 && i % 4 == 0) {
          newText.write(' '); // Agregar un espacio cada 4 caracteres
        }
        newText.write(formattedText[i]);
      }
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class _MonthYearInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String formattedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (formattedText.isEmpty) {
      return TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final StringBuffer newText = StringBuffer();
    newText.write(formattedText.substring(0, min(formattedText.length, 2))); // MM
    if (formattedText.length > 2) {
      newText.write('/' + formattedText.substring(2, min(formattedText.length, 4))); // YY
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}