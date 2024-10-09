import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/main_app/page4/dev_page.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 8, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 8, 0),
        title: Text(
          "Paramètres",
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
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 122, 8, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    "Se connecter via adresse e-mail",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 122, 8, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    "Passer à la version pro",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "- Supprime les pubs\n"
                    "- Vous permettra d'envoyer plus demandes à Trainer.ai",
                    style: GoogleFonts.montserrat(
                        color: const Color.fromARGB(255, 198, 198, 198),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 122, 8, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    "A propos des développeurs",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const dev_page())));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
