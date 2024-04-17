import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/PaymentScreens/pay_collects.dart';
class PayCollect extends StatelessWidget {
  const PayCollect({super.key});

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
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/icons/ProfileScreen/back.svg',
                  height: 25,
                  alignment: Alignment.topRight,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ProfileScreen/Wallet.svg',
                    height: 25,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Pagos y cobros',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PayCollects())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ProfileScreen/PayMethod.svg',
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Métodos de pago',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/ProfileScreen/arrow.svg',
                      height: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ProfileScreen/Transaction.svg',
                        height: 25,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Transacciones',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/icons/ProfileScreen/arrow.svg',
                    height: 25,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}