import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '1_exos_page.dart';
import '2_trainer_ai_page.dart';
import '3_workout_tracker.dart';
import '4_settings.dart';

class Mainapppage extends StatefulWidget {
  const Mainapppage({super.key});

  @override
  _MainapppageState createState() => _MainapppageState();
}

class _MainapppageState extends State<Mainapppage> {
  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = [
    Exos(),
    const trainer_ai(),
    const WorkoutTracker(),
    settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          height: 72,
          color: const Color.fromARGB(255, 122, 8, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GNav(
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linear,
                );
              },
              backgroundColor: const Color.fromARGB(255, 122, 8, 0),
              gap: 6,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 190, 55, 50),
              padding: const EdgeInsets.all(16),
              tabs: [
                GButton(
                    icon: Icons.sports_gymnastics,
                    iconSize: 25,
                    text: "EXERCICES",
                    textStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700)),
                GButton(
                    icon: Icons.person_pin_rounded,
                    iconSize: 25,
                    text: "TRAINER.AI",
                    textStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700)),
                GButton(
                    icon: Icons.dashboard_customize_outlined,
                    iconSize: 25,
                    text: "TRACKER",
                    textStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700)),
                GButton(
                    icon: Icons.settings,
                    iconSize: 25,
                    text: "PARAMETRES",
                    textStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
        ));
  }
}
