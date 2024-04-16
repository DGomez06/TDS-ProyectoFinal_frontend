import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lease_managment/Providers/Properties/property.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createproperty.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createpropertylocation.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/createpro/createpropertyplus.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/homeLandlord.dart';
import 'package:provider/provider.dart';

class ToggleSliderCreateProperty extends StatefulWidget {
  const ToggleSliderCreateProperty({Key? key}) : super(key: key);

  @override
  State<ToggleSliderCreateProperty> createState() =>
      _ToggleSliderCreatePropertyState();
}

class _ToggleSliderCreatePropertyState
    extends State<ToggleSliderCreateProperty> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<PropertyData>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreensLandlord()));
                  },
                  child: SvgPicture.asset(
                    'assets/icons/ProfileScreen/back.svg',
                    height: 25,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              const Text(
                'NUEVA PROPIEDAD',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildToggleButton('General', 0),
                    _buildToggleButton('Ubicación', 1),
                    _buildToggleButton('Adicional', 2),
                  ],
                ),
              ),
              SizedBox(
                height: 700,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: indexProvider.selectedIndex  * 300 * -1,
                      width: 420,
                      child: buildPage(const CreateProperty()),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: (1 - indexProvider.selectedIndex) * 420,
                      width: 420,
                      child: buildPage(const CreatePropertyLocation()),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: (2 - indexProvider.selectedIndex) * 420,
                      width: 420,
                      child: buildPage(const CreatePropertyPlus()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, int index) {
    final indexProvider = Provider.of<PropertyData>(context);
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            setState(() {
              _selectedIndex = index;
              indexProvider.setIndex(index);
            });
          },
          child: Text(
            label,
            style: TextStyle(
              color: indexProvider.selectedIndex == index ? Colors.blue : Colors.black,
              fontSize: 15,
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 120,
          height: 1,
          color: indexProvider.selectedIndex == index ? Colors.blue : Colors.grey,
        ),
      ],
    );
  }

  Widget buildPage( Widget buildPage,) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 700,
      width: 420,
      child: buildPage,
    );
  }
}