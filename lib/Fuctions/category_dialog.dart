import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/information.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensLandlord/newproperty.dart';
import 'package:lease_managment/models/products.dart';
import 'package:provider/provider.dart';

class DialogManager {
  static void showSubcategoryMenuPropiedad(
      BuildContext context,
      String selectedCategory,
      String selectedSubCategory,
      Function(String) updateSubCategory,
      Function(String) updateCategory) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecciona una subcategoría'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Edificio'),
                  onTap: () {
                    updateSubCategory('Edificio');
                    updateCategory('Tipo de Propiedad');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Casa'),
                  onTap: () {
                    updateSubCategory('Casa');
                    updateCategory('Tipo de Propiedad');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('PentHouse'),
                  onTap: () {
                    updateSubCategory('PentHouse');
                    updateCategory('Tipo de Propiedad');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Planta'),
                  onTap: () {
                    updateSubCategory('Planta');
                    updateCategory('Tipo de Propiedad');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showSubcategoryMenuTamano(
      BuildContext context,
      String selectedCategory,
      String selectedSubCategory,
      Function(String) updateSubCategory,
      Function(String) updateCategory) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecciona una subcategoría'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Grande'),
                  onTap: () {
                    updateSubCategory('Big');
                    updateCategory('Tamaño');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Mediano'),
                  onTap: () {
                    updateSubCategory('Medium');
                    updateCategory('Tamaño');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Pequeño'),
                  onTap: () {
                    updateSubCategory('Small');
                    updateCategory('Tamaño');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showSubcategoryMenuPrecio(
    BuildContext context,
    String selectedCategory,
    String selectedSubCategory,
    TextEditingController searchController1,
    TextEditingController searchController2,
    Function(String) updateSubCategory,
    Function(String, String) onsSearchPressed,
  ) {
    String text1 = searchController1.text.replaceAll(',', '');
    String text2 = searchController2.text.replaceAll(',', '');

    int? value1 = int.tryParse(text1);
    int? value2 = int.tryParse(text2);

    String formattedValue1 =
        value1 != null ? NumberFormat('#,###').format(value1) : '';
    String formattedValue2 =
        value2 != null ? NumberFormat('#,###').format(value2) : '';

    searchController1.value = TextEditingValue(
      text: formattedValue1,
      selection: TextSelection.collapsed(offset: formattedValue1.length),
    );

    searchController2.value = TextEditingValue(
      text: formattedValue2,
      selection: TextSelection.collapsed(offset: formattedValue2.length),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecciona una subcategoría'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text('Ingrese el precio > a:'),
                TextField(
                  controller: searchController1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsSeparatorInputFormatter()
                  ],
                  onChanged: (text) {
                    String formattedValue = text.replaceAll(',', '');
                    int? value = int.tryParse(formattedValue);
                    String text1 = formattedValue;
                    if (value != null) {
                      text1 = NumberFormat('#,###').format(value);
                    }
                    updateSubCategory(text1);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xFFc2c2c2),
                        width: 1.2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    labelText: 'Precio',
                  ),
                ),
                const Text('Ingrese el precio < a:'),
                TextField(
                  controller: searchController2,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsSeparatorInputFormatter()
                  ],
                  onChanged: (text) {
                    String formattedValue = text.replaceAll(',', '');
                    int? value = int.tryParse(formattedValue);
                    String text2 = formattedValue;
                    if (value != null) {
                      text2 = NumberFormat('#,###').format(value);
                    }
                    updateSubCategory(text2);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xFFc2c2c2),
                        width: 1.2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    labelText: 'Precio',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    onsSearchPressed(searchController1.text.replaceAll(',', ''),
                        searchController2.text.replaceAll(',', ''));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Buscar'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static void detailsFav(
      BuildContext context, Properties property, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Qué desea hacer?'),
          content: Consumer<StatusProvider>(
              builder: (context, propertiesProvider, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF26C2E4), Color(0x8026C2E4)]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return DetailScreen(
                                property: property,
                                imageUrl: imageUrl,
                              );
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = const Offset(0.0, 1.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration:
                                const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: Text('Detalles',
                          style: GoogleFonts.yaldevi(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
                Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(top: 20),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF26C2E4), Color(0x2026C2E4)]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: TextButton(
                        onPressed: () {
                          // Acción para "Contactar"
                        },
                        child: Text('Contactar',
                            style: GoogleFonts.yaldevi(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)))),
              ],
            );
          }),
        );
      },
    );
  }

  static void confirmationProperty(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false, // Asegura que la pantalla anterior sea visible durante la transición
        pageBuilder: (BuildContext context, _, __) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                GestureDetector(
                  // Para cerrar el diálogo si se toca fuera de él
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.black.withOpacity(0.5), // Fondo oscuro semi-transparente
                  ),
                ),
                Center(
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _,
                      curve: Curves.ease,
                    )),
                    child: AlertDialog(
                      title: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            alignment: Alignment.center,
                            width: 80,
                            height: 73,
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF26C2E4), Color(0x8026C2E4)]),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            
                            ),
                            child: Transform.scale(
                              scale: 1.2,
                              child: SvgPicture.asset(
                                'assets/icons/iconConfirmation.svg',
                              ),
                            ),
                          ),
                          Text(
                            'Confirmación',
                            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '¿Estás seguro de crear una propiedad?',
                            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 80,
                                height: 35,
                                padding: const EdgeInsets.only(bottom: 1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(width: 1, color: Colors.black),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) =>
                                            const NewPropertyPage(),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                          const begin = Offset(1.0, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.ease;

                                          final tween = Tween(begin: begin, end: end).chain(
                                            CurveTween(curve: curve),
                                          );

                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text('Sí', style: TextStyle(color: Colors.black)),
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 35,
                                padding: const EdgeInsets.only(bottom: 1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(width: 1, color: Colors.black),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No', style: TextStyle(color: Colors.black),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }




  //siguiente showDialog
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;

    if (newText.isEmpty || newText.length <= 3) {
      return newValue;
    }

    String clearedValue = newText.replaceAll(',', '');

    String formattedValue = clearedValue.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

