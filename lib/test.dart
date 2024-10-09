/* import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymapp/main_app/page1/blocs/workouts_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wakelock/wakelock.dart';
import 'main_app/page1/models/exercises.dart';
import 'main_app/page1/models/workout.dart';

//dossier: screens, nom: home_page.dart
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('workouttime')),
      body: SingleChildScrollView(
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context, workouts) => ExpansionPanelList.radio(
              children: workouts
                  .map((workout) => ExpansionPanelRadio(
                      value: workout,
                      headerBuilder: (BuildContext context, bool isExpanded) =>
                          ListTile(
                            visualDensity: const VisualDensity(
                                horizontal: 0,
                                vertical: VisualDensity.maximumDensity),
                            leading: IconButton(
                                onPressed: () {
                                  BlocProvider.of<WorkoutCubit>(context)
                                      .editWorkout(
                                          workout, workouts.indexOf(workout));
                                },
                                icon: const Icon(Icons.edit)),
                            title: Text(workout.title!),
                            trailing:
                                Text(formatTime(workout.getTotal(), true)),
                            onTap: () {
                              !isExpanded
                                  ? BlocProvider.of<WorkoutCubit>(context)
                                      .startWorkout(workout)
                                  : null;
                            },
                          ),
                      body: ListView.builder(
                          shrinkWrap: true,
                          itemCount: workout.exercises.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                                onTap: null,
                                visualDensity: const VisualDensity(
                                    horizontal: 0,
                                    vertical: VisualDensity.maximumDensity),
                                leading: Text(formatTime(
                                    workout.exercises[index].prelude!, true)),
                                title: Text(workout.exercises[index].title!),
                                trailing: Text(formatTime(
                                    workout.exercises[index].duration!, true)),
                              ))))
                  .toList()),
        ),
      ),
    );
  }
}

//nom: helpers.dart
String formatTime(int seconds, bool pad) {
  return (pad)
      ? "${(seconds / 60).floor()}:${(seconds % 60).toString().padLeft(2, "0")}"
      : (seconds > 59)
          ? "${(seconds / 60).floor()}:${(seconds % 60).toString().padLeft(2, "0")}"
          : seconds.toString();
}

//dossier: blocs, nom:workout_cubit.dart
class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(const WorkoutInitial());

  Timer? _timer;

  editWorkout(Workout workout, int index) {
    return emit(WorkoutEditing(workout, index, null));
  }

  editExercise(int? exIndex) {
    return emit(WorkoutEditing(
        state.workout, (state as WorkoutEditing).index, exIndex));
  }

  pauseWorkout() => emit(WorkoutPaused(state.workout, state.elapsed));
  resumeWorkout() => emit(WorkoutInProgress(state.workout, state.elapsed));

  goHome() => emit(const WorkoutInitial());

  onTick(Timer timer) {
    if (state is WorkoutInProgress) {
      WorkoutInProgress wip = state as WorkoutInProgress;
      if (wip.elapsed! < wip.workout!.getTotal()) {
        emit(WorkoutInProgress(wip.workout, wip.elapsed! + 1));
      } else {
        _timer!.cancel();
        Wakelock.disable();
        emit(const WorkoutInitial());
      }
    }
  }

  startWorkout(Workout workout, [int? index]) {
    Wakelock.enable();
    if (index != null) {
    } else {
      emit(WorkoutInProgress(workout, 0));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }
}

// dossier: states, nom:workout_states.dart
abstract class WorkoutState extends Equatable {
  final Workout? workout;
  final int? elapsed;
  const WorkoutState(this.workout, this.elapsed);
}

class WorkoutInitial extends WorkoutState {
  const WorkoutInitial() : super(null, 0);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WorkoutInProgress extends WorkoutState {
  const WorkoutInProgress(Workout? workout, int? elapsed)
      : super(workout, elapsed);

  @override
  // TODO: implement props
  List<Object?> get props => [workout, elapsed];
}

class WorkoutEditing extends WorkoutState {
  final int index;
  final int? exIndex;
  const WorkoutEditing(Workout? workout, this.index, this.exIndex)
      : super(workout, 0);

  @override
  // TODO: implement props
  List<Object?> get props => [workout, index, exIndex];
}

class WorkoutPaused extends WorkoutState {
  const WorkoutPaused(Workout? workout, int? elapsed) : super(workout, elapsed);

  @override
  // TODO: implement props
  List<Object?> get props => [workout, elapsed];
}

// dossier: screens, nom: edit_workout_screen.dart
class EditWorkoutScreen extends StatelessWidget {
  const EditWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child:
            BlocBuilder<WorkoutCubit, WorkoutState>(builder: (context, state) {
          WorkoutEditing we = state as WorkoutEditing;
          return Scaffold(
            appBar: AppBar(
                title: InkWell(
                  child: Text(we.workout!.title!),
                  onTap: () => showDialog(
                      context: context,
                      builder: (_) {
                        final controller =
                            TextEditingController(text: we.workout!.title);
                        return AlertDialog(
                          content: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                                labelText: "Titre de l'entraînement"),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  if (controller.text.isNotEmpty) {
                                    Navigator.pop(context);
                                    Workout renamed = we.workout!
                                        .copywith(title: controller.text);
                                    BlocProvider.of<WorkoutsCubit>(context)
                                        .saveWorkout(renamed, we.index);
                                    BlocProvider.of<WorkoutCubit>(context)
                                        .editWorkout(renamed, we.index);
                                  }
                                },
                                child: const Text("Renommer"))
                          ],
                        );
                      }),
                ),
                leading: BackButton(
                  onPressed: () =>
                      BlocProvider.of<WorkoutCubit>(context).goHome(),
                )),
            body: ListView.builder(
                itemCount: we.workout!.exercises.length,
                itemBuilder: (context, index) {
                  Exercise exercise = we.workout!.exercises[index];
                  if (we.exIndex == index) {
                    return EditExerciseScreen(
                        workout: we.workout,
                        index: we.index,
                        exIndex: we.exIndex);
                  } else {
                    return ListTile(
                      leading: Text(formatTime(exercise.prelude!, true)),
                      title: Text(exercise.title!),
                      trailing: Text(formatTime(exercise.duration!, true)),
                      onTap: () => BlocProvider.of<WorkoutCubit>(context)
                          .editExercise(index),
                    );
                  }
                }),
          );
        }),
        onWillPop: () => BlocProvider.of<WorkoutCubit>(context).goHome());
  }
}

// dossier: screen, nom:edit_exercise_screen.dart
class EditExerciseScreen extends StatefulWidget {
  final Workout? workout;
  final int index;
  final int? exIndex;
  const EditExerciseScreen(
      {super.key, this.workout, required this.index, this.exIndex});

  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  TextEditingController? _title;

  @override
  void initState() {
    _title = TextEditingController(
        text: widget.workout!.exercises[widget.exIndex!].title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: InkWell(
              onLongPress: () => showDialog(
                  context: context,
                  builder: (_) {
                    final controller = TextEditingController(
                        text: widget
                            .workout!.exercises[widget.exIndex!].prelude!
                            .toString());
                    return AlertDialog(
                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                            labelText: "Prelude (seconds)"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                Navigator.pop(context);
                                setState(() {
                                  widget.workout!.exercises[widget.exIndex!] =
                                      widget.workout!.exercises[widget.exIndex!]
                                          .copyWith(
                                              prelude:
                                                  int.parse(controller.text));
                                  BlocProvider.of<WorkoutsCubit>(context)
                                      .saveWorkout(
                                          widget.workout!, widget.index);
                                });
                              }
                            },
                            child: const Text('save'))
                      ],
                    );
                  }),
              child: NumberPicker(
                itemHeight: 30,
                value: widget.workout!.exercises[widget.exIndex!].prelude!,
                minValue: 0,
                maxValue: 3599,
                textMapper: (strVal) => formatTime(int.parse(strVal), false),
                onChanged: (value) => setState(() {
                  widget.workout!.exercises[widget.exIndex!] = widget
                      .workout!.exercises[widget.exIndex!]
                      .copyWith(prelude: value);
                  BlocProvider.of<WorkoutsCubit>(context)
                      .saveWorkout(widget.workout!, widget.index);
                }),
              ),
            )),
            Expanded(
                flex: 3,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _title,
                  onChanged: (value) => setState(() {
                    widget.workout!.exercises[widget.exIndex!] = widget
                        .workout!.exercises[widget.exIndex!]
                        .copyWith(title: value);
                    BlocProvider.of<WorkoutsCubit>(context)
                        .saveWorkout(widget.workout!, widget.index);
                  }),
                )),
            Expanded(
                child: InkWell(
              onLongPress: () => showDialog(
                  context: context,
                  builder: (_) {
                    final controller = TextEditingController(
                        text: widget
                            .workout!.exercises[widget.exIndex!].duration!
                            .toString());
                    return AlertDialog(
                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                            labelText: "Duration (seconds)"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                Navigator.pop(context);
                                setState(() {
                                  widget.workout!.exercises[widget.exIndex!] =
                                      widget.workout!.exercises[widget.exIndex!]
                                          .copyWith(
                                              duration:
                                                  int.parse(controller.text));
                                  BlocProvider.of<WorkoutsCubit>(context)
                                      .saveWorkout(
                                          widget.workout!, widget.index);
                                });
                              }
                            },
                            child: const Text('save'))
                      ],
                    );
                  }),
              child: NumberPicker(
                itemHeight: 30,
                value: widget.workout!.exercises[widget.exIndex!].duration!,
                minValue: 0,
                maxValue: 3599,
                textMapper: (strVal) => formatTime(int.parse(strVal), false),
                onChanged: (value) => setState(() {
                  widget.workout!.exercises[widget.exIndex!] = widget
                      .workout!.exercises[widget.exIndex!]
                      .copyWith(duration: value);
                  BlocProvider.of<WorkoutsCubit>(context)
                      .saveWorkout(widget.workout!, widget.index);
                }),
              ),
            )),
          ],
        )
      ],
    );
  }
}

// dossier: screens, nom:workout_progress.dart
class WorkoutProgress extends StatelessWidget {
  const WorkoutProgress({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _getStats(Workout workout, int workoutElapsed) {
      int workoutTotal = workout.getTotal();
      Exercise exercise = workout.getCurrentExercise(workoutElapsed);
      int exerciseElapsed = workoutElapsed - exercise.startTime!;

      int exerciseRemaining = exercise.prelude! - exerciseElapsed;
      bool isPrelude = exerciseElapsed < exercise.prelude!;
      int exerciseTotal = isPrelude ? exercise.prelude! : exercise.duration!;
      if (!isPrelude) {
        exerciseElapsed -= exercise.prelude!;
        exerciseRemaining += exercise.duration!;
      }

      return {
        "workoutTitle": workout.title,
        "workoutProgress": workoutElapsed / workoutTotal,
        "workoutElapsed": workoutElapsed,
        "totalExercises": workout.exercises.length,
        "currentExerciseIndex": exercise.index!.toInt(),
        "workoutRemaining": workoutTotal - workoutElapsed,
        "exerciseRemaining": exerciseRemaining,
        "exerciseProgress": exerciseElapsed / exerciseTotal,
        "isPrelude": isPrelude
      };
    }

    Future<List<dynamic>> _loadMedias() async {
      String jsonString = await rootBundle.loadString('assets/media.json');
      List<dynamic> medias = json.decode(jsonString)['medias'];
      return medias;
    }

    return BlocConsumer<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          final stats = _getStats(state.workout!, state.elapsed!);
          return Scaffold(
            appBar: AppBar(
              title: Text(state.workout!.title.toString()),
              leading: BackButton(
                onPressed: () =>
                    BlocProvider.of<WorkoutCubit>(context).goHome(),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.blue,
                    minHeight: 10,
                    value: stats["workoutProgress"],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(stats["workoutElapsed"], true)),
                        DotsIndicator(
                            dotsCount: stats["totalExercises"],
                            position: stats["currentExerciseIndex"]),
                        Text("-${formatTime(stats["workoutRemaining"], true)}")
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    child: FutureBuilder<List<dynamic>>(
                      future: _loadMedias(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<dynamic> medias = snapshot.data!;
                          // Utilisez les médias ici selon les besoins
                          return const Text('Médias chargés : ${1}');
                        } else if (snapshot.hasError) {
                          return const Text(
                              'Erreur lors du chargement des médias');
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (state is WorkoutInProgress) {
                        BlocProvider.of<WorkoutCubit>(context).pauseWorkout();
                      } else if (state is WorkoutPaused) {
                        BlocProvider.of<WorkoutCubit>(context).resumeWorkout();
                      }
                    },
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: [
                        Center(
                          child: SizedBox(
                            height: 220,
                            width: 220,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  stats['isPrelude']
                                      ? Colors.red
                                      : Colors.blue),
                              strokeWidth: 25,
                              value: stats['exerciseProgress'],
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 220,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.asset("assets/stopwatch.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        listener: ((context, state) {}));
  }
}
 */