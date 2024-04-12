import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {


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
            const SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/ProfileScreen/About.svg'),
                  const SizedBox(width: 10.0,),
                  const Text('Acerca De:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                  
                ],
              ),
            ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Integrantes del trabajo: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
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
