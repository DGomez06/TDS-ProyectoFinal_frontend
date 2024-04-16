import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lease_managment/Providers/Properties/propertiesProvider.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/information.dart';
import 'package:lease_managment/models/properties.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PropertyDataProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.fetchContent(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<Content> contentList = value.filteredContentApi.isNotEmpty
                  ? value.filteredContentApi
                  : (value.filteredContent.isNotEmpty
                      ? value.filteredContent
                      : value.contentData);
              return buildGrid(contentList, context);
            }
          },
        );
      },
    );
  }


  Widget buildGrid(
    List<Content> contentList,
    BuildContext context,
  ) {
    return Consumer<PropertyDataProvider>(
      builder: (context, value, child) {
        // value.filterContentApi();
        // value.fetchContent();
        // List<Content> contentList = value.filteredContentApi.isNotEmpty
        //     ? value.filteredContentApi
        //     : value.filteredContent;

        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 13.0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.56,
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
                        return DetailScreen(
                          content: contentList[index],
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
                child: _buildPropertyItem(
                  contentList[index],
                  context,
                  index,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildPropertyItem(
    Content content,
    BuildContext context,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 170,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: content.images.isNotEmpty
                    ? Image.network(
                        content.images.first.url,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors
                            .grey, // Puedes mostrar un placeholder o color de fondo alternativo
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
                  circleColor: const CircleColor(
                    start: Colors.redAccent,
                    end: Colors.red,
                  ),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.redAccent,
                  ),
                  // isLiked: propertiesProvider.addedPropertiesList
                  //     .contains(properties),
                  // likeBuilder: (bool isFav) {
                  //   return SvgPicture.asset(
                  //     'assets/icons/FavRounded.svg',
                  //     color: isFav ? Colors.red : const Color(0xFF292D32),
                  //     height: 30,
                  //   );
                  // },
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
                content.address,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              Text(
                content.description,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
              Text(
                NumberFormat.currency(symbol: 'RD\$').format(content.price),
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
