import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/components/heat_map.dart';
import 'package:gymapp/main_app/page3/data/hive_database.dart';
import 'package:gymapp/main_app/page3/data/workout_data.dart';
import 'package:gymapp/main_app/page3/workout_page.dart';
import 'package:provider/provider.dart';

class WorkoutTracker extends StatefulWidget {
  const WorkoutTracker({super.key});

  @override
  State<WorkoutTracker> createState() => _WorkoutTrackerState();
}

class _WorkoutTrackerState extends State<WorkoutTracker> {
  @override
  void initState() {
    super.initState();
    Provider.of<WorkoutData>(context, listen: false).initializedWorkoutList();
  }

  final newWorkoutNameController = TextEditingController();

  void createNewWorkout() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 122, 8, 0),
              title: Text("Créer une nouvelle séance",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              content: TextField(
                controller: newWorkoutNameController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Nom de la séance',
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
              ),
              actions: [
                MaterialButton(
                    onPressed: () {
                      if (newWorkoutNameController.text.isNotEmpty) {
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
            ));
  }

  void goToWorkoutPage(String workoutName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => WorkoutPage(workoutName: workoutName))));
  }

  void save() {
    String newWorkoutName = newWorkoutNameController.text;
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 122, 8, 0),
                title: Text(
                  "Workout Tracker",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 122, 8, 0),
                onPressed: createNewWorkout,
                child: const Icon(Icons.add, color: Colors.white, size: 35),
              ),
              body: Container(
                  color: const Color.fromARGB(255, 122, 8, 0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 190, 55, 50),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 122, 8, 0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: MyHeatMap(
                            startDateYYYYMMDD: value.getStartDate(),
                            datasets: value.heatmapDataSet,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.getWorkoutList().length,
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 122, 8, 0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                            child: ListTile(
                              title: Text(
                                value.getWorkoutList()[index].name,
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.white,
                              ),
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          const Color.fromARGB(255, 122, 8, 0),
                                      title: Text('Supprimer la séance ?',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700)),
                                      actions: <Widget>[
                                        MaterialButton(
                                            onPressed: () {
                                              HiveDatabase()
                                                  .deleteFromDatabase(index);
                                              setState(() {
                                                value
                                                    .getWorkoutList()
                                                    .removeAt(index);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Supprimer",
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700))),
                                      ],
                                    );
                                  },
                                );
                              },
                              onTap: () => goToWorkoutPage(
                                  value.getWorkoutList()[index].name),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
  }
}
