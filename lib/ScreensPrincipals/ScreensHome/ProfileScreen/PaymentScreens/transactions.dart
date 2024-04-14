import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            SvgPicture.asset(
              'assets/icons/ProfileScreen/back.svg',
              height: 25,
              alignment: Alignment.topRight,
            ),
            const SizedBox(height: 20),
            Row(
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 5),
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
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    elevation: 5,
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
                Positioned(
                  right: -20, // Posiciona el círculo justo en el borde derecho
                  top: 20, // Posiciona el círculo justo en el borde superior
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF26C2E4),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right:
                      -5, // Ajusta esta posición para alinear la flecha como desees
                  top:
                      30, // Ajusta esta posición para alinear la flecha como desees
                  child: SvgPicture.asset(
                    'assets/icons/ProfileScreen/arrow.svg',
                    height: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
