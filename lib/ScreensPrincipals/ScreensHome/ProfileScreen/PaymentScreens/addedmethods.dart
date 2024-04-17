import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/ProfileScreen/PaymentScreens/pay_collects.dart';

class AddedMethods extends StatefulWidget {
  const AddedMethods({super.key});

  @override
  AddedMethodsState createState() => AddedMethodsState();
}

class AddedMethodsState extends State<AddedMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const SizedBox(
            height: 15.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('Métodos de pago ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Descubre nuestro método de pago seguro mientras te embarcas en la búsqueda de tu próxima vivienda.  ',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: const [
                  ListTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
