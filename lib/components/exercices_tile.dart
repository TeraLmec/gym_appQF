// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main_app/page3/data/hive_database.dart';

class ExerciseTile extends StatelessWidget {
  bool isChecked = false;
  static int _currentIndex = 0;

  ExerciseTile({
    Key? key,
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.isCompleted,
    required this.onCheckBoxChanged,
  }) : super(key: key) {
    _currentIndex++;
  }
  final int index2 = _currentIndex;
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  void Function(bool?)? onCheckBoxChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 122, 8, 0),
              title: Text('Supprimer la séance ?',
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              actions: <Widget>[
                TextButton(
                  child: Text('Supprimer',
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                  onPressed: () {
                    HiveDatabase().deleteFromDatabase(index2);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      onTap: () {
        onCheckBoxChanged!(isChecked);
      },
      trailing: Transform.scale(
        scale: 1.5,
        child: Checkbox(
            activeColor: const Color.fromARGB(255, 190, 55, 50),
            onChanged: (value) => onCheckBoxChanged!(value),
            value: isCompleted),
      ),
      title: Text(exerciseName,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w700)),
      subtitle: Row(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 190, 55, 50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text('$weight kgs',
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 190, 55, 50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text('$reps reps',
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 190, 55, 50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text('$sets séries',
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w500)),
        ),
      ]),
    );
  }
}
