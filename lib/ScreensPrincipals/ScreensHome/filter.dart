import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Providers/Properties/propertiesProvider.dart';
import 'package:provider/provider.dart';

class FilterContainer extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onClose;
  const FilterContainer({
    Key? key,
    required this.isVisible,
    required this.onClose,
  }) : super(key: key);

  @override
  State<FilterContainer> createState() => _FilterContainer();
}

class _FilterContainer extends State<FilterContainer>
    with SingleTickerProviderStateMixin {
  RangeValues _currentRangeValues = const RangeValues(2000, 50000);
  int selectedRooms = 0;
  int selectedBath = 0;
  late AnimationController _animationController;
  late Animation<double> _animation = AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(_animationController
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _isSelected1 = false;
  bool _isSelected2 = false;
  void _onPressed1() {
    setState(() {
      _isSelected1 = true;
      _isSelected2 = false;
    });
  }

  void _onPressed2() {
    setState(() {
      _isSelected1 = false;
      _isSelected2 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        margin: const EdgeInsets.only(top: 50),
        duration: const Duration(milliseconds: 500),
        width: widget.isVisible ? MediaQuery.of(context).size.width : 0,
        height: widget.isVisible ? 900 : 0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 125),
                const Text(
                  'Filtros',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset('assets/icons/edificio.svg')
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categoría de alquileres",
                            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Donde te sientas más cómodo!",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          )
                        ]
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: _onPressed1,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: _onPressed1,
                                style: TextButton.styleFrom(
                                  backgroundColor: _isSelected1
                                      ? const Color(0xFF26c2e4)
                                      : Colors.white,
                                  foregroundColor: _isSelected1
                                      ? Colors.white
                                      : const Color(0xFF26c2e4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.house,
                                      color: _isSelected1
                                          ? Colors.white
                                          : const Color(0xFF26c2e4),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text("Casa"),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: _onPressed2,
                                style: TextButton.styleFrom(
                                  backgroundColor: _isSelected2
                                      ? const Color(0xFF26c2e4)
                                      : Colors.white,
                                  foregroundColor: _isSelected2
                                      ? Colors.white
                                      : const Color(0xFF26c2e4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/buildings.svg',
                                      color: _isSelected2
                                          ? Colors.white
                                          : const Color(0xFF26c2e4),
                                      height: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text("Departamento"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              indent: 30,
              endIndent: 30,
              thickness: 1,
            ),
            Column(children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Rango de precio',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350,
                child: FlutterSlider(
                    values: [
                      _currentRangeValues.start,
                      _currentRangeValues.end
                    ],
                    rangeSlider: true,
                    max: 50000,
                    min: 2000,
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      if (lowerValue >= 2000) {
                        setState(() {
                          _currentRangeValues =
                              RangeValues(lowerValue, upperValue);
                        });
                      }
                    },
                    handlerHeight: 22,
                    handler: FlutterSliderHandler(
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(1),
                        decoration: const BoxDecoration(
                          color: Color(0xFF22D4FB),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )),
                    rightHandler: FlutterSliderHandler(
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(1),
                        decoration: const BoxDecoration(
                          color: Color(0xFF22D4FB),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: 15,
                      activeTrackBar: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF22D4FB), Color(0xFF01A7E1)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                      ),
                      inactiveTrackBar: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF767676),
                          gradient: const LinearGradient(
                              colors: [Color(0xFFd6d6d6), Color(0xFF747474)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      inactiveTrackBarHeight: 15,
                    )),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    width: 130,
                    height: 50,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [const Text('Minimo'), Text('RD\$${_currentRangeValues.start.toString().substring(0, _currentRangeValues.start.toString().length - 2).replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',')}')])),
                Container(
                  width: 25,
                  height: 2,
                  decoration: const BoxDecoration(color: Color(0xFFd3d2d2)),
                ),
                Container(
                    width: 130,
                    height: 50,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [const Text('Maximo'), Text('RD\$${_currentRangeValues.end.toString().substring(0, _currentRangeValues.end.toString().length - 2).replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',')}')])),
              ])
            ]),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              indent: 30,
              endIndent: 30,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Aposentos del lugar',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Habitaciones',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              height: 70.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  int rooms = index;
                  String label = rooms == 0
                      ? 'Cualquiera'
                      : rooms < 9
                          ? rooms.toString()
                          : '8+';
                  double fontSize = rooms == 0 ? 18.0 : 16.0;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRooms = rooms;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: rooms == 0 ? 120 : 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: selectedRooms == rooms
                              ? const Color(0xFF26C2E4)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: Center(
                        child: Text(
                          label,
                          style: GoogleFonts.inter(
                            fontSize: fontSize,
                            color: selectedRooms == rooms
                                ? Colors.white
                                : Colors.black,
                            fontWeight: selectedRooms == rooms
                                ? FontWeight.bold
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Baños',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              height: 70.0,
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  int rooms = index;
                  String label = rooms == 0
                      ? 'Cualquiera'
                      : rooms < 9
                          ? rooms.toString()
                          : '8+';
                  double fontSize = rooms == 0 ? 18.0 : 16.0;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBath = rooms;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: rooms == 0 ? 120 : 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: selectedBath == rooms
                              ? const Color(0xFF26C2E4)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: Center(
                        child: Text(
                          label,
                          style: GoogleFonts.inter(
                            fontSize: fontSize,
                            color: selectedBath == rooms
                                ? Colors.white
                                : Colors.black,
                            fontWeight: selectedBath == rooms
                                ? FontWeight.bold
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              indent: 30,
              endIndent: 30,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTapDown: (details) {
                _animationController.forward();
              },
              onTapUp: (details) {
                _animationController.forward();
                Future.delayed(const Duration(milliseconds: 200), () {
                  _animationController.reverse();
                });
                Future.delayed(const Duration(milliseconds: 400), () {
                  final filtered = Provider.of<PropertyDataProvider>(context, listen: false);
                  filtered.filterContentApi(
                    type: _isSelected1 ? 'Casa' : 'Apartamento',
                    minPrice: _currentRangeValues.start,
                    maxPrice: _currentRangeValues.end,
                    rooms: selectedRooms,
                    bathrooms: selectedBath,
                  );
                  widget.onClose();
                });
              },
              child: ScaleTransition(
                scale: _animation,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xFF26C2E4),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Text('Guardar',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
