import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/components/exercices_tile.dart';
import 'package:gymapp/main_app/page3/data/workout_data.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key, required this.workoutName});
  final String workoutName;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  void onCheckBoxChanged(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercise(workoutName, exerciseName);
  }

  final exerciseNameController = TextEditingController();
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsController = TextEditingController();

  void createNewExercise() {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 122, 8, 0),
              title: Text("Ajouter un nouvel exercice",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Nom de l'exercice",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 190, 55, 50),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                    controller: exerciseNameController,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Masse(en kg)",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 190, 55, 50),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                    controller: weightController,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Nombre de répétition",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 190, 55, 50),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                    controller: repsController,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Nombre de série",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 190, 55, 50),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                    controller: setsController,
                  )
                ],
              ),
              actions: [
                MaterialButton(
                    onPressed: () {
                      if (exerciseNameController.text.isNotEmpty) {
                        save();
                      }
                    },
                    child: Text("Ajouter",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.w700))),
                MaterialButton(
                    onPressed: cancel,
                    child: Text("Annuler",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.w700)))
              ],
            )));
  }

  void save() {
    String newExerciseName = exerciseNameController.text;
    String weight = weightController.text;
    String reps = repsController.text;
    String sets = setsController.text;

    Provider.of<WorkoutData>(context, listen: false)
        .addExercise(widget.workoutName, newExerciseName, weight, reps, sets);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    exerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
        builder: (context, value, child) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 122, 8, 0),
              onPressed: createNewExercise,
              child: const Icon(Icons.add, color: Colors.white, size: 35),
            ),
            appBar: AppBar(
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                widget.workoutName,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 122, 8, 0),
            ),
            body: Container(
              color: const Color.fromARGB(255, 190, 55, 50),
              child: ListView.builder(
                  itemCount:
                      value.numberOfExercisesInWorkout(widget.workoutName),
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 122, 8, 0), // Couleur de fond du container
                          borderRadius: BorderRadius.circular(
                              15), // Rayon des bordures arrondies
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 5, top: 10),
                        child: ExerciseTile(
                            exerciseName: value
                                .getRelevantWorkout(widget.workoutName)
                                .exercises[index]
                                .name,
                            weight: value
                                .getRelevantWorkout(widget.workoutName)
                                .exercises[index]
                                .weight,
                            reps: value
                                .getRelevantWorkout(widget.workoutName)
                                .exercises[index]
                                .reps,
                            sets: value
                                .getRelevantWorkout(widget.workoutName)
                                .exercises[index]
                                .sets,
                            isCompleted: value
                                .getRelevantWorkout(widget.workoutName)
                                .exercises[index]
                                .isCompleted,
                            onCheckBoxChanged: (val) => onCheckBoxChanged(
                                  widget.workoutName,
                                  value
                                      .getRelevantWorkout(widget.workoutName)
                                      .exercises[index]
                                      .name,
                                )),
                      )),
            )));
  }
}
