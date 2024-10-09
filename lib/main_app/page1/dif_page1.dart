import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/main_app/page1/page1_deb.dart';

class Dif_page1 extends StatelessWidget {
  const Dif_page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 122, 8, 0),
        title: Text(
          "Niveau",
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
    return Column(
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
              "DÉBUTANT",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              "Exercices conçus pour novices en entraînement physique. Découvrez l'univers du sport de façon ludique et progressive avec nous !",
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Page1_deb())));
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
          child: ListTile(
            title: Text(
              "HABITUÉ",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              "Exercices conçus pour les sportifs aguerris connaissant un minimum l'univers du sport ! Prêts à relever le défi ?",
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
              "AVANCÉ",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              "Exercices pour les sportifs avancés ! Ces exercices mettront vos compétences physiques à l'épreuve",
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
      ],
    );
  }
}

/* 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../test.dart';
import 'blocs/workouts_cubit.dart';

class Dif_page1 extends StatelessWidget {
  const Dif_page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
            providers: [
          BlocProvider<WorkoutsCubit>(create: (BuildContext context) {
            WorkoutsCubit workoutsCubit = WorkoutsCubit();
            if (workoutsCubit.state.isEmpty) {
              workoutsCubit.getWorkouts();
              print("...the state is empty");
            } else {
              print("...the state is not empty");
            }
            return workoutsCubit;
          }),
          BlocProvider<WorkoutCubit>(
              create: (BuildContext context) => WorkoutCubit())
        ],
            child: BlocBuilder<WorkoutCubit, WorkoutState>(
              builder: (context, state) {
                if (state is WorkoutInitial) {
                  return const Homepage();
                } else if (state is WorkoutEditing) {
                  return const EditWorkoutScreen();
                }
                return const WorkoutProgress();
              },
            )));
  }
}
 */