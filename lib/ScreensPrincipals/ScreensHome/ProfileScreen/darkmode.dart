import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DarkMode extends StatefulWidget {
  @override
  _DarkModeState createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  String _mode = 'light';

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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/ProfileScreen/moon.svg'),
                  SizedBox(width: 10.0,),
                  Text('Modo Oscuro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
                  
                ],
              ),
            ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: SvgPicture.asset('assets/icons/ProfileScreen/moonlines.svg'),
                    title: Text('Modo Oscuro'),
                    trailing: Radio(
                      value: 'dark',
                      groupValue: _mode,
                      onChanged: (value) {
                        setState(() {
                          _mode = value!;
                        });
                      },
                    ),
                  ),
                  const Divider( indent: 30, endIndent: 30,),
                  ListTile(
                    leading: SvgPicture.asset('assets/icons/ProfileScreen/sun.svg'),
                    title: Text('Modo Claro'),
                    trailing: Radio(
                      value: 'light',
                      groupValue: _mode,
                      onChanged: (value) {
                        setState(() {
                          _mode = value!;
                        });
                      },
                    ),
                  ),
                  const Divider(indent: 30, endIndent: 30,),
                  ListTile(
                    leading: SvgPicture.asset('assets/icons/ProfileScreen/bars.svg'),
                    title: Text('Configuración del sistema'),
                    trailing: Radio(
                      value: 'dark',
                      groupValue: _mode,
                      onChanged: (value) {
                        setState(() {
                          _mode = value!;
                        });
                      },
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
