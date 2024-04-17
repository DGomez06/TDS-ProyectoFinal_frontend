import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionsEmpty extends StatefulWidget {
  const TransactionsEmpty({super.key});

  @override
  TransactionsEmptyState createState() => TransactionsEmptyState();
}

class TransactionsEmptyState extends State<TransactionsEmpty> {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/Payment/emptywallet.svg'),
                const SizedBox(
                  width: 10.0,
                ),
                const Text('Transaciones',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: const [
                  ListTile(
                    title: Text(
                      'Aquí podrás ver tus pagos cuando hallas realizado tu primer pago y podrás comprobar los pagos hechos.  ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
