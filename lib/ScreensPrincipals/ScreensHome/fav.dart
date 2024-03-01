import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/Fuctions/category_dialog.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/models/products.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  final VoidCallback onPressed;
  const FavScreen({super.key, required this.onPressed});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {

  bool add = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(
      builder: (context, propertiesProvider, child) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  width: 350,
                  height: 90,
                  margin: const EdgeInsets.only(top: 60),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Favoritos',
                              style: GoogleFonts.inter(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/icons/Active/FavRoundedblue.svg', width: 35, height: 35,)
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 350,
                                child: Text(
                                  'Guarda los lugares que mas te gustan para mas tarde!',
                                  style: GoogleFonts.inter(fontSize: 15),
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                )),
                          ],
                        ),
                      ]),
                ),
                add
                    ? Center(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 3),
                          margin: const EdgeInsets.only(top: 300, bottom: 300),
                          child: IconButton(
                            icon: const Icon(Icons.add_circle_outline_rounded,
                                size: 100, color: Colors.blue),
                            onPressed: () {
                              setState(() {
                                widget.onPressed();
                                add = false;
                              });
                            },
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 350,
                        height: 700,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 13.0,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.56,
                          padding: const EdgeInsets.all(10.0),
                          children: List.generate(
                            propertiesProvider.addedPropertiesList.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  DialogManager.detailsFav(
                                    context,
                                    propertiesProvider
                                        .addedPropertiesList[index],
                                    propertiesProvider.propertiesImage[index]);
                                    
                                },
                                child: _buildPropertyItem(
                                  propertiesProvider.addedPropertiesList[index],
                                  propertiesProvider.propertiesImage[index],
                                  context,
                                  propertiesProvider,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPropertyItem(
    Properties properties,
    String imageUrl,
    BuildContext context,
    StatusProvider propertiesProvider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 170,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              top: 8,
              left: 8,
              child: LikeButton(
                size: 30,
                circleColor: const CircleColor(
                  start: Colors.redAccent,
                  end: Colors.red,
                ),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: Colors.red,
                  dotSecondaryColor: Colors.redAccent,
                ),
                onTap: (isLiked) async {
                  isLiked = !isLiked;
                  if (isLiked) {
                    propertiesProvider.addSelectedProperty(
                        properties, imageUrl);
                  } else {
                    propertiesProvider.removeSelectedProperty(
                        properties, imageUrl);
                  }


                  await Future.delayed(const Duration(
                      milliseconds:
                          100)); 
                  return isLiked;
                },
                isLiked:
                    propertiesProvider.addedPropertiesList.contains(properties),
                likeBuilder: (bool isFav) {
                  return Icon(
                    Icons.favorite,
                    color: isFav ? Colors.red : Colors.grey,
                    size: 30,
                  );
                },
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 5),
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                properties.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              Text(
                properties.direccion,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
              Text(
                NumberFormat.currency(symbol: 'RD\$')
                    .format(properties.rentalPrice),
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
