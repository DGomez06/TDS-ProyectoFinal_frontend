import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Fuctions/category_dialog.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/list.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  String searchTerm = '';
  String selectedCategory = '';
  String selectedSubCategory = '';
  TextEditingController searchController1 = TextEditingController();
  TextEditingController searchController2 = TextEditingController();


  @override
  void initState() {
    super.initState();
    Provider.of<StatusProvider>(context, listen: false)
        .fetchPropertiesAndImages();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<StatusProvider>(
            builder: (context, propertiesProvider, child) {
          return propertiesProvider.propertiesData.isEmpty
              ? Center(
                  child: CircularPercentIndicator(
                  radius: 170,
                  lineWidth: 40,
                  animation: true,
                  animationDuration: 5000,
                  percent: 1,
                  center: Text('Cargando.......',
                      style: GoogleFonts.yaldevi(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blue,
                ))
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextField(
                                  onChanged: (value) {
                                    Provider.of<StatusProvider>(context,
                                            listen: false)
                                        .setSearchTerm(value);
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    prefixIcon: Transform.scale(scale: 0.5,child: SvgPicture.asset('assets/icons/Lupa.svg',)),
                                    labelText: 'Buscar',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: const Color(0xFFc2c2c2),
                                  width: 1.2,
                                ),
                              ),
                              child: PopupMenuButton<String>(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color(0xFFc2c2c2),
                                    width: 1.2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                icon: SvgPicture.asset('assets/icons/Settings.svg'),
                                onSelected: (String value) {
                                  if (value == 'Precio') {
                                    DialogManager.showSubcategoryMenuPrecio(
                                        context,
                                        selectedCategory,
                                        selectedSubCategory,
                                        searchController1,
                                        searchController2, (String newValue) {
                                      setState(() {
                                        selectedSubCategory = newValue;
                                      });
                                    }, (String value1, String value2) {
                                      Provider.of<StatusProvider>(context,
                                              listen: false)
                                          .updateFilteredProperties(
                                              'Precio',
                                              '',
                                              int.parse(value1),
                                              int.parse(value2));
                                    });
                                  } else if (value == 'Tipo de Propiedad') {
                                    DialogManager.showSubcategoryMenuPropiedad(
                                      context,
                                      selectedCategory,
                                      selectedSubCategory,
                                      (String newValue) {
                                        setState(() {
                                          selectedSubCategory = newValue;
                                        });
                                      },
                                      (String newCategory) {
                                        setState(() {
                                          selectedCategory = newCategory;
                                        });
                                        Provider.of<StatusProvider>(context,
                                                listen: false)
                                            .updateFilteredProperties(
                                                selectedCategory,
                                                selectedSubCategory,
                                                0,
                                                0);
                                      },
                                    );
                                  } else if (value == 'Tamaño') {
                                    DialogManager.showSubcategoryMenuTamano(
                                        context,
                                        selectedCategory,
                                        selectedSubCategory, (String newValue) {
                                      setState(() {
                                        selectedSubCategory = newValue;
                                      });
                                    }, (String newCategory) {
                                      setState(() {
                                        selectedCategory = newCategory;
                                      });
                                      Provider.of<StatusProvider>(context,
                                              listen: false)
                                          .updateFilteredProperties(
                                              selectedCategory,
                                              selectedSubCategory,
                                              0,
                                              0);
                                    });
                                  } else if (value == 'Borrar Filtro') {
                                    Provider.of<StatusProvider>(context,
                                            listen: false)
                                        .updateFilteredProperties('', '', 0, 0);
                                    setState(() {
                                      selectedCategory = '';
                                      selectedSubCategory = '';
                                    });
                                  }
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: 'Precio',
                                    child: Text('Precio'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'Tipo de Propiedad',
                                    child: Text('Tipo de Propiedad'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'Tamaño',
                                    child: Text('Tamaño'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'Borrar Filtro',
                                    child: Text('Borrar Filtro'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(
                              bottom: 0.5, left: 5, right: 5),
                          width: 700,
                          height: 670,
                          child: const ListViewScreen()
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}


