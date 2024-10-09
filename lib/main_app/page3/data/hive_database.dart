import 'package:gymapp/main_app/page3/datatime/data_time.dart';
import 'package:hive/hive.dart';

import '../models/exercise.dart';
import '../models/workout.dart';

class HiveDatabase {
  final _mybox = Hive.box("workout_database2");

  void initialize() {
    Hive.openBox("workout_database2");
  }

  bool previousDataExists() {
    if (_mybox.isEmpty) {
      print("Les données précédentes n'existent pas");
      _mybox.put("START_DATE", todayDateYYYYMMDD());
      return false;
    } else {
      print("Les données précédentes existent");

      return true;
    }
  }

  String getStartDate() {
    return _mybox.get("START_DATE");
  }

  void saveToDatabase(List<Workout> workouts) {
    final workoutList = convertObjectToWorkoutList(workouts);
    final exerciseList = convertObjectToExerciseList(workouts);

    if (exerciseCompleted(workouts)) {
      _mybox.put("COMPLETION_STATUS_${todayDateYYYYMMDD()}", 1);
    } else {
      _mybox.put("COMPLETION_STATUS_${todayDateYYYYMMDD()}", 0);
    }

    _mybox.put("WORKOUTS", workoutList);
    _mybox.put("EXERCISES", exerciseList);
  }

  List<Workout> readFromDatabase() {
    List<Workout> mySavedWorkouts = [];

    List<String> workoutNames = _mybox.get("WORKOUTS");
    final exerciseDetails = _mybox.get("EXERCISES");

    for (int i = 0; i < workoutNames.length; i++) {
      List<Exercise> exercisesInEachWorkout = [];

      for (int j = 0; j < exerciseDetails[i].length; j++) {
        exercisesInEachWorkout.add(Exercise(
            name: exerciseDetails[i][j][0],
            weight: exerciseDetails[i][j][1],
            reps: exerciseDetails[i][j][2],
            sets: exerciseDetails[i][j][3],
            isCompleted: exerciseDetails[i][j][4] == "true" ? true : false));
      }
      Workout workout =
          Workout(name: workoutNames[i], exercises: exercisesInEachWorkout);
      mySavedWorkouts.add(workout);
    }
    return mySavedWorkouts;
  }

  bool exerciseCompleted(List<Workout> workouts) {
    for (var workout in workouts) {
      for (var exercise in workout.exercises) {
        if (exercise.isCompleted) {
          return true;
        }
      }
    }
    return false;
  }

  int getCompletionStatus(String yyyymmdd) {
    int completionStatus = _mybox.get("COMPLETION_STATUS_$yyyymmdd") ?? 0;
    return completionStatus;
  }

  void deleteFromDatabase(int index) {
    List<String> workoutNames = _mybox.get("WORKOUTS");
    final exerciseDetails = _mybox.get("EXERCISES");
    workoutNames.removeAt(index);
    exerciseDetails.removeAt(index);
    _mybox.put("WORKOUTS", workoutNames);
    _mybox.put("EXERCISES", exerciseDetails);
  }
}

List<String> convertObjectToWorkoutList(List<Workout> workouts) {
  List<String> workoutList = [];
  for (int i = 0; i < workouts.length; i++) {
    workoutList.add(workouts[i].name);
  }
  return workoutList;
}

List<List<List<String>>> convertObjectToExerciseList(List<Workout> workouts) {
  List<List<List<String>>> exerciseList = [];

  for (int i = 0; i < workouts.length; i++) {
    List<Exercise> exercisesInWorkout = workouts[i].exercises;

    List<List<String>> individualWorkout = [];

    for (int j = 0; j < exercisesInWorkout.length; j++) {
      List<String> individualExercise = [];
      individualExercise.addAll([
        exercisesInWorkout[j].name,
        exercisesInWorkout[j].weight,
        exercisesInWorkout[j].reps,
        exercisesInWorkout[j].sets,
        exercisesInWorkout[j].isCompleted.toString()
      ]);
      individualWorkout.add(individualExercise);
    }
    exerciseList.add(individualWorkout);
  }
  return exerciseList;
}
