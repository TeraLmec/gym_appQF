import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1_deb extends StatelessWidget {
  const Page1_deb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 122, 8, 0),
        title: Text(
          "Corps complet - Débutant",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: const Color.fromARGB(255, 122, 8, 0),
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 190, 55, 50),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Dificulty(),
        ),
      ),
    );
  }
}

class Dificulty extends StatelessWidget {
  const Dificulty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 122, 8, 0),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: ListTile(
          leading: const Icon(
            Icons.help_outline,
            color: Colors.white,
            size: 35,
          ),
          title: Text(
            "CONSEILS",
            style: GoogleFonts.montserrat(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            "Cliquez pour afficher les conseils",
            style: GoogleFonts.montserrat(
                color: const Color.fromARGB(255, 198, 198, 198),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(
            Icons.chat_bubble_outline_outlined,
            size: 30,
            color: Colors.white,
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 122, 8, 0),
                    title: Text('CONSEILS',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    content: Text(
                      "- Commencez par des exercices de base tels que les squats, les pompes et les tractions pour renforcer les muscles de votre corps entier.\n"
                      "- Ajoutez progressivement des poids ou des répétitions à mesure que vous progressez pour continuer à stimuler vos muscles et à améliorer votre forme physique globale.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ));
              },
            );
          },
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 122, 8, 0),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "Mountain\nClimber",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('0 kgs',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('2 minutes',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('2 séries',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: const Color.fromARGB(255, 122, 8, 0),
                          title: Text('Mountain Climber',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          content: Text(
                            "- Commencez par vous échauffer correctement pour éviter les blessures.\n\n"
                            "- Placez-vous en position de planche, les mains à plat sur le sol et les épaules au-dessus des poignets.\n\n"
                            "- Ramenez un genou vers la poitrine, puis tendez-le en arrière et ramenez l'autre genou vers la poitrine.\n\n"
                            "- Alternez les mouvements rapidement pendant 30 secondes à 1 minute.\n\n"
                            "- Gardez votre dos droit et votre corps aligné tout au long de l'exercice.\n\n"
                            "- Répétez l'exercice plusieurs fois pour un entraînement complet.\n",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ));
                    },
                  );
                },
                icon: const Icon(
                  Icons.help_outline,
                  color: Color.fromARGB(255, 190, 55, 50),
                  size: 60,
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/exos/complet/complet (1).gif',
                width: 250,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 122, 8, 0),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "Deadlift\nHaltères",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('5 kgs',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('8 reps',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('5 séries',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: const Color.fromARGB(255, 122, 8, 0),
                          title: Text('Deadlift Haltères',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          content: Text(
                            "- Commencez avec un poids léger et concentrez-vous sur la bonne technique avant d'augmenter le poids.\n\n"
                            "- Gardez votre dos droit, vos jambes écartées à la largeur des épaules, et soulevez les haltères en gardant vos bras tendus le long de votre corps.",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ));
                    },
                  );
                },
                icon: const Icon(
                  Icons.help_outline,
                  color: Color.fromARGB(255, 190, 55, 50),
                  size: 60,
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/exos/complet/complet (2).gif',
                width: 250,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 122, 8, 0),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "High\nKnee",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('0 kgs',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('2 minutes',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('2 séries',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: const Color.fromARGB(255, 122, 8, 0),
                          title: Text('High Knee',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          content: Text(
                            "- Commencez avec un poids léger et concentrez-vous sur la bonne technique avant d'augmenter le poids.\n\n"
                            "- Gardez votre dos droit, vos jambes écartées à la largeur des épaules, et soulevez les haltères en gardant vos bras tendus le long de votre corps.",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ));
                    },
                  );
                },
                icon: const Icon(
                  Icons.help_outline,
                  color: Color.fromARGB(255, 190, 55, 50),
                  size: 60,
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/exos/complet/complet (3).gif',
                width: 250,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 122, 8, 0),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "Planche\ninversée",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('0 kgs',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('2 minutes',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('2 séries',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: const Color.fromARGB(255, 122, 8, 0),
                          title: Text('Mountain Climber',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          content: Text(
                            "- Commencez par vous échauffer correctement pour éviter les blessures.\n\n"
                            "- Placez-vous en position de planche, les mains à plat sur le sol et les épaules au-dessus des poignets.\n\n"
                            "- Ramenez un genou vers la poitrine, puis tendez-le en arrière et ramenez l'autre genou vers la poitrine.\n\n"
                            "- Alternez les mouvements rapidement pendant 30 secondes à 1 minute.\n\n"
                            "- Gardez votre dos droit et votre corps aligné tout au long de l'exercice.\n\n"
                            "- Répétez l'exercice plusieurs fois pour un entraînement complet.\n",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ));
                    },
                  );
                },
                icon: const Icon(
                  Icons.help_outline,
                  color: Color.fromARGB(255, 190, 55, 50),
                  size: 60,
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/exos/complet/complet (4).gif',
                width: 250,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 122, 8, 0),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "Jumping\nJack",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('0 kgs',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('2 minutes',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 190, 55, 50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('2 séries',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: const Color.fromARGB(255, 122, 8, 0),
                          title: Text('Mountain Climber',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          content: Text(
                            "- Commencez par vous échauffer correctement pour éviter les blessures.\n\n"
                            "- Placez-vous en position de planche, les mains à plat sur le sol et les épaules au-dessus des poignets.\n\n"
                            "- Ramenez un genou vers la poitrine, puis tendez-le en arrière et ramenez l'autre genou vers la poitrine.\n\n"
                            "- Alternez les mouvements rapidement pendant 30 secondes à 1 minute.\n\n"
                            "- Gardez votre dos droit et votre corps aligné tout au long de l'exercice.\n\n"
                            "- Répétez l'exercice plusieurs fois pour un entraînement complet.\n",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ));
                    },
                  );
                },
                icon: const Icon(
                  Icons.help_outline,
                  color: Color.fromARGB(255, 190, 55, 50),
                  size: 60,
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/exos/complet/complet (5).gif',
                width: 250,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      )
    ]);
  }
}
