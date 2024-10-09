import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/main_app/page1/dif_page1.dart';

class Exos extends StatefulWidget {
  @override
  State<Exos> createState() => _ExosState();
}

class _ExosState extends State<Exos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 122, 8, 0),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 122, 8, 0),
          title: Text(
            "Exercices",
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 190, 55, 50),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const TrainType(),
        ));
  }
}

class TrainType extends StatelessWidget {
  const TrainType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Card(
          shadowColor: const Color.fromARGB(255, 122, 8, 0),
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(150, 122, 8, 0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(children: [
            Ink.image(
              image: const AssetImage("assets/images/fullbody.png"),
              height: 220,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: const Color.fromARGB(150, 122, 8, 0),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Dif_page1())));
                },
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 122, 8, 0),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "CORPS COMPLET",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ]),
        ),
        /* 
        Card(
          shadowColor: const Color.fromARGB(255, 122, 8, 0),
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(150, 122, 8, 0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(children: [
            Ink.image(
              image: const AssetImage("assets/images/fullbodynm.jpg"),
              height: 220,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: const Color.fromARGB(150, 122, 8, 0),
                onTap: () {},
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 122, 8, 0),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "CORPS COMPLET\nSans matériel",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ]),
        ),
        Card(
          shadowColor: const Color.fromARGB(255, 122, 8, 0),
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(150, 122, 8, 0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(children: [
            Ink.image(
              image: const AssetImage("assets/images/tonification.jpg"),
              height: 220,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: const Color.fromARGB(150, 122, 8, 0),
                onTap: () {},
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 122, 8, 0),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "TONIFICATION",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ]),
        ), */
        Card(
          shadowColor: const Color.fromARGB(255, 122, 8, 0),
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(150, 122, 8, 0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(children: [
            Ink.image(
              image: const AssetImage("assets/images/abs.jpeg"),
              height: 220,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: const Color.fromARGB(150, 122, 8, 0),
                onTap: () {},
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 122, 8, 0),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "ABDOS",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ]),
        ),
        Card(
          shadowColor: const Color.fromARGB(255, 122, 8, 0),
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(150, 122, 8, 0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(children: [
            Ink.image(
              image: const AssetImage("assets/images/arm.jpg"),
              height: 220,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: const Color.fromARGB(150, 122, 8, 0),
                onTap: () {},
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 122, 8, 0),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "BRAS",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ]),
        ),
        Card(
          shadowColor: const Color.fromARGB(255, 122, 8, 0),
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(150, 122, 8, 0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(children: [
            Ink.image(
              image: const AssetImage("assets/images/benchpress.jpg"),
              height: 220,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: const Color.fromARGB(150, 122, 8, 0),
                onTap: () {},
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 122, 8, 0),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "PECTORAUX",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ]),
        ),
        Card(
          shadowColor: const Color.fromARGB(255, 122, 8, 0),
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(150, 122, 8, 0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(children: [
            Ink.image(
              image: const AssetImage("assets/images/backshoulders.jpeg"),
              height: 220,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: const Color.fromARGB(150, 122, 8, 0),
                onTap: () {},
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 122, 8, 0),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "EPAULES ET DOS",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ]),
        ),
        Card(
          shadowColor: const Color.fromARGB(255, 122, 8, 0),
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(150, 122, 8, 0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(children: [
            Ink.image(
              image: const AssetImage("assets/images/lowbody.png"),
              height: 220,
              fit: BoxFit.cover,
              child: InkWell(
                splashColor: const Color.fromARGB(150, 122, 8, 0),
                onTap: () {},
              ),
            ),
            IgnorePointer(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 122, 8, 0),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "BAS DU CORPS",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
