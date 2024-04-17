import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/icons/ProfileScreen/back.svg',
                height: 25,
                alignment: Alignment.topRight,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Payment/emptywallet.svg',
                  height: 25,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Transacciones',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Dic 2023',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color(0xFFD3D2D2), width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/Payment/PayPal.svg',
                        height: 50,
                      ),
                      title: const Text(
                        'PayPal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        '20/02/2024',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      trailing: const Text(
                        'RD\$ 4500',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right:
                    15, // Ajusta esta posición para alinear la flecha como desees
                top:
                    20, // Ajusta esta posición para alinear la flecha como desees
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                          context); // Cerrar el showModalBottomSheet
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/ProfileScreen/back.svg',
                                      height: 25,
                                    ),
                                  ),
                                  const SizedBox(width: 120),
                                  const Text(
                                    'Pago',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    'Marcelo Comando',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 80),
                                  Text('-RD\$4500',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    'Mar 5, 12:35',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(),
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    'De tarjeta',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '****** 0000',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              const Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    'Id de la transaccion',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    '182934859820BDFSD34',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF26C2E4),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Payment/arrow_white.svg',
                      height: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
