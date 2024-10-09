import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main_app/main_app_page.dart';

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({Key? key}) : super(key: key);
  @override
  _PresentationScreenState createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isLastPage = false;
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: _pageIndex == 0
                    ? presentation_main()
                    : const Mainapppage()),
          ),
        ],
      ),
    );
  }

  void _nextPage() {
    if (_currentPage == 2) {
      setState(() {
        _isLastPage = true;
      });
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _goToOtherPage() {
    setState(() {
      _pageIndex = _pageIndex == 0 ? 1 : 0;
    });
    print('Aller à une autre page');
  }

  Widget presentation_main() {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child:
                          Image.asset('assets/images/qflongr.png', width: 330),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 150, bottom: 150, left: 35, right: 35),
                            child: Column(
                              children: [
                                Image.asset('assets/images/calendar.gif',
                                    scale: 2),
                                const SizedBox(height: 30.0),
                                Text(
                                  'EXERCICES PRÉCONÇUS',
                                  style: GoogleFonts.montserrat(
                                      color:
                                          const Color.fromARGB(255, 122, 8, 0),
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Travaillez sur des exercies selon votre sexe, niveau et objectifs',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child:
                          Image.asset('assets/images/qflongr.png', width: 330),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 150, bottom: 150, left: 35, right: 35),
                            child: Column(
                              children: [
                                Image.asset('assets/images/plan.gif', scale: 1),
                                const SizedBox(height: 30.0),
                                Text(
                                  'Trainer.AI',
                                  style: GoogleFonts.montserrat(
                                      color:
                                          const Color.fromARGB(255, 122, 8, 0),
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Profitez du support de Trainer.AI pour des conseils aussi bien en sport que sur le plan nutritionnel',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child:
                          Image.asset('assets/images/qflongr.png', width: 330),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 150, bottom: 150, left: 35, right: 35),
                            child: Column(
                              children: [
                                Image.asset('assets/images/tracker.gif',
                                    scale: 1),
                                const SizedBox(height: 30.0),
                                Text(
                                  'WORKOUT TRACKER',
                                  style: GoogleFonts.montserrat(
                                      color:
                                          const Color.fromARGB(255, 122, 8, 0),
                                      fontSize: 45,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Personnalisez vos séances selon vos envies',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
            _isLastPage = false;
          });
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Animator(
          duration: const Duration(milliseconds: 600),
          tween: Tween<double>(begin: 0.6, end: 1),
          cycles: 0,
          builder: (context, animatorState, child) {
            return Opacity(
              opacity: animatorState.value,
              child: child,
            );
          },
          child: TextButton.icon(
            onPressed: _isLastPage ? _goToOtherPage : _nextPage,
            icon: Icon(
                _isLastPage ? Icons.sports_martial_arts : Icons.navigate_next,
                size: 50),
            label: Text(
              _isLastPage ? 'COMMENCER !' : 'SUIVANT',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 122, 8, 0),
              textStyle: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
