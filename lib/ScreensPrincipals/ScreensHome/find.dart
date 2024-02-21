import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/information.dart';
import 'package:lease_managment/models/products.dart';
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
  late List<Properties> propertiesData;
  late List<String> imageUrls;
  late String selectedCategory;
  String? selectedSubCategory;
  List<Properties> filteredList = [];
  late List<Properties> originalPropertiesData;
  late String searchTerm = '';
  final TextEditingController searchController1 = TextEditingController();
  final TextEditingController searchController2 = TextEditingController();
  String formattedValue1 = '';
  int _result1 = 0;
  String formattedValue2 = '';
  int _result2 = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    propertiesData = [];
    imageUrls = [];
    fetchData();
    originalPropertiesData = [];
    selectedCategory = '';
    searchController1.addListener(_formatValue1);
    searchController2.addListener(_formatValue2);
  }

  @override
  void dispose() {
    super.dispose();
    searchController1.dispose();
    searchController2.dispose();
  }

  void _formatValue1() {
    final value = int.tryParse(searchController1.text.replaceAll(',', ''));
    if (value != null) {
      setState(() {
        formattedValue1 = NumberFormat('#,###').format(value);
        searchController1.value = TextEditingValue(
          text: formattedValue1,
          selection: TextSelection.collapsed(offset: formattedValue1.length),
        );
        _result1 = value;
      });
    }
  }
  void _formatValue2() {
    final value = int.tryParse(searchController2.text.replaceAll(',', ''));
    if (value != null) {
      setState(() {
        formattedValue2 = NumberFormat('#,###').format(value);
        searchController2.value = TextEditingValue(
          text: formattedValue2,
          selection: TextSelection.collapsed(offset: formattedValue2.length),
        );
        _result2 = value;
      });
    }
  }

  Future<void> fetchData() async {
    try {
      final propertiesResponse =
          await Dio().get('https://retoolapi.dev/YBZy86/propiedades');
      final List<dynamic> propertiesJson = propertiesResponse.data;
      final List<Properties> propertiesMap =
          propertiesJson.map((e) => Properties.fromJson(e)).toList();

      setState(() {
        propertiesData = propertiesMap;
        originalPropertiesData = List.from(propertiesMap);
      });

      fetchRandomImageUrls();
    } catch (e) {
      // Manejar el error
    }
  }

  Future<void> fetchRandomImageUrls() async {
  try {
    final List<Future<Response>> imageFutures = propertiesData.map((property) {
      return Dio().get('https://picsum.photos/200');
    }).toList();

    final List<Response> responses = await Future.wait(imageFutures);

    final List<String> urls = responses.map((response) {
      if (response.statusCode == 200) {
        return response.realUri.toString();
      } else {
        return 'https://via.placeholder.com/200x300'; // URL de respaldo en caso de error
      }
    }).toList();

    setState(() {
      imageUrls = urls;
      isLoading = false;
    });

    final imageUrlProvider = Provider.of<ContainerVisibility>(context, listen: false);
    imageUrlProvider.setImageUrl(urls.isNotEmpty ? urls[0] : '');

    for (int i = 0; i < propertiesData.length; i++) {
    propertiesData[i].imageUrl = urls.isNotEmpty ? urls[i] : '';
}
  } catch (e) {
    // Manejar el error
  }
}



  void filterProperties(String selectedCategory) {
    List<Properties> tempFilteredList = List.from(originalPropertiesData);

    if (selectedCategory == 'Precio') {
      tempFilteredList = tempFilteredList
          .where((element) =>
              element.precioAlquiler > _result1 && element.precioAlquiler < _result2)
          .toList();
    } else if (selectedCategory == 'Tipo de Propiedad') {
      if (selectedSubCategory != null) {
        TipoDePropiedad? selectedType =
            tipoDePropiedadValues.map[selectedSubCategory!];
        if (selectedType != null) {
          tempFilteredList = tempFilteredList
              .where((element) => element.tipoDePropiedad == selectedType)
              .toList();
        }
      }
    } else if (selectedCategory == 'Tamaño') {
      if (selectedSubCategory != null) {
        Tamano? selectedSize = tamanoValues.map[selectedSubCategory!];
        if (selectedSize != null) {
          tempFilteredList = tempFilteredList
              .where((element) => element.tamano == selectedSize)
              .toList();
        }
      }
    }

    // Aplicar filtrado por término de búsqueda
    tempFilteredList = tempFilteredList
        .where((element) =>
            element.direccion.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();

    setState(() {
      propertiesData = tempFilteredList.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularPercentIndicator(
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
              )
            :Container(
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
                            setState(() {
                              searchTerm = value;
                            });
                            filterProperties(selectedCategory);
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            prefixIcon: const Icon(Icons.search),
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
                        icon: const Icon(Icons.filter_alt_outlined),
                        onSelected: (String value) {
                          if (value == 'Precio') {
                            showSubcategoryMenuPrecio();
                          } else if (value == 'Tipo de Propiedad') {
                            // Aquí podrías abrir otro menú emergente con las subcategorías
                            showSubcategoryMenuPropiedad();
                          } else if (value == 'Tamaño') {
                            showSubcategoryMenuTamano();
                          } else if (value == 'Borrar Filtro') {
                            setState(() {
                              propertiesData = originalPropertiesData;
                            });
                          } else {
                            setState(() {
                              selectedCategory = value;
                            });
                            filterProperties(selectedCategory);
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
                  padding:
                      const EdgeInsets.only(bottom: 0.5, left: 5, right: 5),
                  width: 700,
                  height: 670,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: const Color(0xFFc2c2c2), width: 1.2),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFc2c2c2),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: propertiesData.length,
                    itemBuilder: (context, index) {
                      Properties properties = propertiesData[index];
                      String imageUrl =
                          imageUrls.isNotEmpty ? imageUrls[index] : '';

                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFc2c2c2)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFc2c2c2),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ListTile(
                            title: Text(properties.nombre),
                            isThreeLine: true,
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return DetailScreen(
                                      property: properties,
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
                                    var offsetAnimation =
                                        animation.drive(tween);
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
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(properties.direccion),
                                Text(
                                  'Precio: \$${NumberFormat('#,###').format(properties.precioAlquiler)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSubcategoryMenuPropiedad() {
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
                    setState(() {
                      selectedSubCategory = 'Edificio';
                    });
                    Navigator.of(context).pop();
                    filterProperties('Tipo de Propiedad');
                  },
                ),
                ListTile(
                  title: const Text('Casa'),
                  onTap: () {
                    setState(() {
                      selectedSubCategory = 'Casa';
                    });
                    Navigator.of(context).pop();
                    filterProperties('Tipo de Propiedad');
                  },
                ),
                ListTile(
                  title: const Text('Penhouse'),
                  onTap: () {
                    setState(() {
                      selectedSubCategory = 'Penhouse';
                    });
                    Navigator.of(context).pop();
                    filterProperties('Tipo de Propiedad');
                  },
                ),
                ListTile(
                  title: const Text('Planta'),
                  onTap: () {
                    setState(() {
                      selectedSubCategory = 'Planta';
                    });
                    Navigator.of(context).pop();
                    filterProperties('Tipo de Propiedad');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSubcategoryMenuTamano() {
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
                    setState(() {
                      selectedSubCategory = 'Grande';
                    });
                    Navigator.of(context).pop();
                    filterProperties('Tamaño');
                  },
                ),
                ListTile(
                  title: const Text('Mediano'),
                  onTap: () {
                    setState(() {
                      selectedSubCategory = 'Mediano';
                    });
                    Navigator.of(context).pop();
                    filterProperties('Tamaño');
                  },
                ),
                ListTile(
                  title: const Text('Pequeño'),
                  onTap: () {
                    setState(() {
                      selectedSubCategory = 'Pequeno';
                    });
                    Navigator.of(context).pop();
                    filterProperties('Tamaño');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSubcategoryMenuPrecio() {
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    setState(() {
                      selectedSubCategory = value;
                    });
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      setState(() {
                        selectedCategory = 'Precio';
                      });
                      filterProperties(selectedCategory);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Buscar'))
              ],
            ),
          ),
        );
      },
    );
  }
}
