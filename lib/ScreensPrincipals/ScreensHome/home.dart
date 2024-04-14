import 'package:animated_svg/animated_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/dashboard.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/fav.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/find.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/message.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/profile.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late final SvgController _controller0 = AnimatedSvgController();
  late final SvgController _controller1 = AnimatedSvgController();
  late final SvgController _controller2 = AnimatedSvgController();
  late final SvgController _controller3 = AnimatedSvgController();
  late final SvgController _controller4 = AnimatedSvgController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animateIcon0();
    _animateIcon1();
    _animateIcon2();
    _animateIcon3();
    _animateIcon4();
  }

  void _animateIcon0() {
    if (selectedIndex == 0) {
      _controller0.reverse();
    } else {
      _controller0.forward();
    }
  }

  void _animateIcon1() {
    if (selectedIndex == 1) {
      _controller1.forward();
    } else {
      _controller1.reverse();
    }
  }

  void _animateIcon2() {
    if (selectedIndex == 2) {
      _controller2.forward();
    } else {
      _controller2.reverse();
    }
  }

  void _animateIcon3() {
    if (selectedIndex == 3) {
      _controller3.forward();
    } else {
      _controller3.reverse();
    }
  }

  void _animateIcon4() {
    if (selectedIndex == 4) {
      _controller4.forward();
    } else {
      _controller4.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = [
      const FindScreen(),
      FavScreen(
        onPressed: () {
          setState(() {
            selectedIndex = 0;
          });
        },
      ),
      const DashboardScreen(),
      const MessageScreenEmpty(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        elevation: 8,
        unselectedItemColor: const Color(0xFF000000),
        selectedItemColor: const Color(0xFF26C2E4),
        selectedFontSize: 15,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
        ),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            _animateIcon0();
            _animateIcon1();
            _animateIcon2();
            _animateIcon3();
            _animateIcon4();
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: AnimatedSvg(
              controller: _controller0,
              duration: const Duration(milliseconds: 500),
              isActive: false,
              size: selectedIndex == 0 ? 22 : 20,
              children: [
                SvgPicture.asset('assets/icons/Active/LupaBlue.svg'),
                SvgPicture.asset(
                  'assets/icons/Desactive/LupaBlack.svg',
                ),
              ],
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSvg(
              controller: _controller1,
              duration: const Duration(milliseconds: 500),
              isActive: false,
              size: selectedIndex == 1 ? 22 : 20,
              children: [
                SvgPicture.asset('assets/icons/Desactive/Favblack.svg'),
                SvgPicture.asset('assets/icons/Active/FavBlue.svg'),
              ],
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSvg(
              controller: _controller2,
              duration: const Duration(milliseconds: 500),
              isActive: false,
              size: selectedIndex == 2 ? 22 : 20,
              children: [
                SvgPicture.asset('assets/icons/Desactive/DashBoardBlack.svg'),
                SvgPicture.asset('assets/icons/Active/DashBoardBlue.svg'),
              ],
            ),
            label: 'Tablero',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSvg(
              controller: _controller3,
              duration: const Duration(milliseconds: 500),
              isActive: false,
              size: selectedIndex == 3 ? 22 : 20,
              children: [
                SvgPicture.asset('assets/icons/Desactive/MessageBlack.svg'),
                SvgPicture.asset('assets/icons/Active/MessageBlue.svg'),
              ],
            ),
            label: 'Mensajes',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSvg(
              controller: _controller4,
              duration: const Duration(milliseconds: 500),
              isActive: false,
              size: selectedIndex == 4 ? 22 : 20,
              children: [
                SvgPicture.asset('assets/icons/Desactive/ProfileBlack.svg'),
                SvgPicture.asset('assets/icons/Active/ProfileBlue.svg'),
              ],
            ),
            label: 'Perfil',
          ),
        ],
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: selectedIndex,
            children: screen,
          ),
        ],
      ),
    );
  }
}
