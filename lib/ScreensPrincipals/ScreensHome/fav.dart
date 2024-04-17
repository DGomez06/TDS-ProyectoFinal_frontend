import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/Fuctions/category_dialog.dart';
import 'package:lease_managment/Providers/Properties/propertiesProvider.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/information.dart';
import 'package:lease_managment/models/favorites.dart';
import 'package:lease_managment/models/properties.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  final VoidCallback? onPressed;
  const FavScreen({super.key, this.onPressed});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  bool add = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(
      builder: (context, propertiesProvider, child) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                          SvgPicture.asset(
                            'assets/icons/Active/FavRoundedblue.svg',
                            width: 35,
                            height: 35,
                          )
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
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                height: 680,
                child: Consumer<PropertyDataProvider>(
                  builder: (context, value, child) {
                    return FutureBuilder(
                      future: value.fetchFavContent(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          List<Favorites> contentList = value.favContent;
                          return buildGrid(contentList, context);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildGrid(
    List<Favorites> contentList,
    BuildContext context,
  ) {
    return Consumer<PropertyDataProvider>(
      builder: (context, value, child) {
        if (contentList.isEmpty) {
          return const Center(
            child: Text('No properties found'),
          );
        }

        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 13.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.55,
          padding: const EdgeInsets.all(10.0),
          children: List.generate(
            contentList.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        ImageFile image = ImageFile(
                          id: contentList[index].property.images.first.id,
                          url: contentList[index].property.images.first.url,
                        );
                        Owner owner = Owner(
                          id: contentList[index].property.owner.id,
                          firstName: contentList[index].property.owner.firstName,
                          lastName: contentList[index].property.owner.lastName,
                          email: contentList[index].property.owner.email,
                          phone: contentList[index].property.owner.phone,
                        );
                        return DetailScreen(
                          content: Content(
                            id: contentList[index].id,
                            address: contentList[index].property.address,
                            status: contentList[index].property.status,
                            description: contentList[index].property.description,
                            size: contentList[index].property.size,
                            rooms: contentList[index].property.rooms,
                            bathrooms: contentList[index].property.bathrooms,
                            price: contentList[index].property.price,
                            type: contentList[index].property.type,
                            latitude: contentList[index].property.latitude,
                            longitude: contentList[index].property.longitude,
                            images: [image],
                            owner: owner,


                          ),
                        );
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
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
                      transitionDuration: const Duration(milliseconds: 500),
                    ),
                  );
                },
                child: LikeButtonWidgetFav(
                  content: contentList[index],
                  value: value,
                ),
              );
            },
          ),
        );
      },
    );
  }

}

class LikeButtonWidgetFav extends StatefulWidget {
  final Favorites content;
  final PropertyDataProvider value;

  const LikeButtonWidgetFav({
    Key? key, required this.content, required this.value,
  }) : super(key: key);

  @override
  LikeButtonWidgetListState createState() => LikeButtonWidgetListState();
}

class LikeButtonWidgetListState extends State<LikeButtonWidgetFav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 170,
              width: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: widget.content.property.images.isNotEmpty
                    ? Image.network(
                        widget.content.property.images.first.url,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey,
                      ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: LikeButton(
                  padding: const EdgeInsets.only(left: 3),
                  size: 23,
                  isLiked: widget.value.favoriteMap[widget.content.property.id] ?? true,
                  circleColor: const CircleColor(
                    start: Colors.redAccent,
                    end: Colors.red,
                  ),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.redAccent,
                  ),
                  onTap: (isLiked) {
                    widget.value.toggleFavorite(widget.content.property.id);
                    return Future.value(!isLiked);
                  },
                  likeBuilder: (isLiked) {
                    return SvgPicture.asset(
                      'assets/icons/FavRounded.svg',
                      color: isLiked ? Colors.red : Colors.grey,
                    );
                  },
                ),
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
                widget.content.property.address,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              Text(
                widget.content.property.description,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
              Text(
                NumberFormat.currency(symbol: 'RD\$').format(widget.content.property.price),
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
