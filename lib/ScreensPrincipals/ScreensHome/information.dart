import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/models/properties.dart';

class DetailScreen extends StatefulWidget {
  final Content content;
  final String? imageUrl;

  const DetailScreen({Key? key, required this.content, this.imageUrl})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    String numberformat =  NumberFormat('#,###').format((widget.content.price));
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.content.images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.content.images);
                      },
                      child: Image.network(
                        widget.content.images[index].url,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 10.0,
                  left: 0,
                  right: 0,
                  child: DotsIndicator(
                    dotsCount: widget.content.images.length,
                    position: _currentIndex,
                    decorator: const DotsDecorator(
                      color: Colors.grey, // Color de los puntos inactivos
                      activeColor: Colors.blue, // Color del punto activo
                      size: Size.square(8.0),
                      activeSize: Size.square(10.0),
                    ),
                  ),
                ),
              ],
                        ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.content.owner.firstName + ' ' + widget.content.owner.lastName,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ubicacion: ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.content.address,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 38,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xFF26C2E4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: (){}, 
                      child: Center(
                        child: Text(
                          'Disponible',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Precio: ',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'RD\$ $numberformat/mes',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color(0xFFD3D2D2),
                    thickness: 2,
                  ),
                  Text(
                    'Comodidades disponibles',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26C2E4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/bed.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Habitaciones: ${widget.content.rooms}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 50,),
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26C2E4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Bathroom.svg',
                          fit: BoxFit.contain,
                        )
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Baños: ${widget.content.bathrooms}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Descripcion',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.content.description,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,

                    ),
                      textAlign: TextAlign.justify,
                  ),
                  
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 270,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/map.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color(0xFFD3D2D2),
                    thickness: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Informacion de contacto',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF26C2E4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text('A', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 23,
                            child: Text(
                              '${widget.content.owner.firstName} ${widget.content.owner.lastName}',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            widget.content.owner.email,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26C2E4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/Active/mail.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showImageDialog(BuildContext context, List<ImageFile> images) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              itemCount: images.length,
              controller: PageController(initialPage: _currentIndex),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Hero(
                  tag: images[index].id,
                  child: Image.network(
                    images[index].url,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
