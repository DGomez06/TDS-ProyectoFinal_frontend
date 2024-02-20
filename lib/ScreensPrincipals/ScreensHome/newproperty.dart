import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPropertyPage extends StatefulWidget {
  const NewPropertyPage({super.key});

  @override
  State<NewPropertyPage> createState() => _NewPropertyPageState();
}

class _NewPropertyPageState extends State<NewPropertyPage> {
  String name = '';
  String address = '';
  String propertyType = '';
  double size = 0.0;
  int numberOfRooms = 0;
  int numberOfBathrooms = 0;
  double rentalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:80.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Property Type'),
                onChanged: (value) {
                  setState(() {
                    propertyType = value;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Size'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    size = double.parse(value);
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Number of Rooms'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    numberOfRooms = int.parse(value);
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Number of Bathrooms'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    numberOfBathrooms = int.parse(value);
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Rental Price'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    rentalPrice = double.parse(value);
                  });
                },
              ),
              const SizedBox(height: 16.0),
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
                  child: TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Guardar',
                    style: GoogleFonts.yaldevi(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
