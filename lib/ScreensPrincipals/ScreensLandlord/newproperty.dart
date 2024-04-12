import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/models/products.dart';
import 'package:provider/provider.dart';

class NewPropertyPage extends StatefulWidget {
  const NewPropertyPage({Key? key}) : super(key: key);

  @override
  State<NewPropertyPage> createState() => _NewPropertyPageState();
}

class _NewPropertyPageState extends State<NewPropertyPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _numberRoomsController = TextEditingController();
  final TextEditingController _rentalPriceController = TextEditingController();
  final TextEditingController _numberBathroomsController =
      TextEditingController();

  late PropertyType _selectedPropertyType;
  late Size _selectedSize;

  @override
  void initState() {
    super.initState();
    _selectedPropertyType = PropertyType.EDIFICIO;
    _selectedSize = Size.BIG;
  }

  String _formatNumber(String value) {
    if (value.isEmpty) {
      return '0';
    } else {
      final formatter = NumberFormat('#,###');
      return formatter.format(int.parse(value.replaceAll(',', '')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<PropertyType>(
                value: _selectedPropertyType,
                onChanged: (value) {
                  setState(() {
                    _selectedPropertyType = value!;
                  });
                },
                items: PropertyType.values.map((type) {
                  return DropdownMenuItem<PropertyType>(
                    value: type,
                    child: Text(propertyTypeValues.reverse[type]!),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Tipo de Propiedad',
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<Size>(
                value: _selectedSize,
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value!;
                  });
                },
                items: Size.values.map((size) {
                  return DropdownMenuItem<Size>(
                    value: size,
                    child: Text(sizeValues.reverse[size]!),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Tamaño',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _numberRoomsController,
                decoration: const InputDecoration(
                  labelText: 'Número de Habitaciones',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _rentalPriceController,
                decoration: const InputDecoration(
                  labelText: 'Precio de Alquiler',
                ),
                inputFormatters: [ThousandsSeparatorInputFormatter()],
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _rentalPriceController.text = _formatNumber(value);
                    _rentalPriceController.selection =
                        TextSelection.fromPosition(
                      TextPosition(offset: _rentalPriceController.text.length),
                    );
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _numberBathroomsController,
                decoration: const InputDecoration(
                  labelText: 'Número de Baños',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  submitPost(context);
                },
                child: const Text('Agregar Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitPost(BuildContext context) async {
    final propertiesProvider =
        Provider.of<StatusProvider>(context, listen: false);

    // Crear un nuevo post (propiedad)
    final newProperty = Properties(
      id: propertiesProvider.propertiesData.length + 1,
      size: _selectedSize,
      nombre: _nombreController.text,
      direccion: _direccionController.text,
      numberRooms: int.tryParse(_numberRoomsController.text) ?? 0,
      rentalPrice:
          int.tryParse(_rentalPriceController.text.replaceAll(',', '')) ?? 0,
      propertyType: _selectedPropertyType,
      numberBathrooms: int.tryParse(_numberBathroomsController.text) ?? 0,
    );

    // Insertar el nuevo post al principio de la lista de propiedades
    await propertiesProvider.apiClient.addNewProperty(newProperty);

    // Reiniciar los controladores de texto después de enviar el post
    _nombreController.clear();
    _direccionController.clear();
    _numberRoomsController.clear();
    _rentalPriceController.clear();
    _numberBathroomsController.clear();
    setState(() {
      _selectedPropertyType = PropertyType.EDIFICIO;
      _selectedSize = Size.BIG;
    });

    await propertiesProvider.apiClient.fetchProperties();
    await propertiesProvider.fetchPropertiesAndImages();

    // Mostrar un SnackBar para indicar que se ha agregado correctamente el nuevo post
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Se ha agregado correctamente el nuevo post'),
        duration: Duration(seconds: 2), // Duración del mensaje
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Eliminar comas
    String newText = newValue.text.replaceAll(',', '');

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
