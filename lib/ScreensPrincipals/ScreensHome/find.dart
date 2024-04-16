import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/Providers/Properties/propertiesProvider.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/filter.dart';
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

class _FindScreenState extends State<FindScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  OverlayEntry? overlayEntry;
  bool isFilterVisible = false;


  @override
  void initState() {
    super.initState();
    Provider.of<StatusProvider>(context, listen: false)
        .fetchProperties();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                      center: Text(
                        'Cargando.......',
                        style: GoogleFonts.yaldevi(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.blue,
                    ),
                  )
                : AnimatedContainer(
                    height: MediaQuery.of(context).size.height,
                    duration: const Duration(milliseconds: 900),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: isFilterVisible
                          ? const Color(0xFF8a8a8a)
                          : Colors.white,
                    ),
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
                                      Provider.of<PropertyDataProvider>(
                                        context,
                                        listen: false,
                                      ).filterContent(value);
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
                                          const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      prefixIcon: Transform.scale(
                                        scale: 0.5,
                                        child: SvgPicture.asset(
                                          'assets/icons/Lupa.svg',
                                        ),
                                      ),
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
                                child: IconButton(
                                  onPressed: _toggleOverlay,
                                  icon: SvgPicture.asset(
                                    'assets/icons/Settings.svg',
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.only(
                              bottom: 0.5,
                              left: 5,
                              right: 5,
                            ),
                            width: 700,
                            height: 670,
                            child: const ListViewScreen(),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          if (isFilterVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  _animationController.reverse();
                },
              ),
            ),
          SlideTransition(
            position: _slideAnimation,
            child: IgnorePointer(
              ignoring: !isFilterVisible,
              child: FilterContainer(
                isVisible: isFilterVisible,
                onClose:
                    _toggleOverlay, // Cambio aquí: Usamos _toggleOverlay para cerrar el overlay
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleOverlay() {
    setState(() {
      if (!isFilterVisible) {
        overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(overlayEntry!);
        _animationController.forward(from: 0);
      } else {
        _animationController.reverse().whenComplete(() {
          overlayEntry!.remove();
          overlayEntry = null;
        });
      }
      isFilterVisible = !isFilterVisible;
    });
  }
}