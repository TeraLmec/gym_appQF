import 'package:flutter/material.dart';
import 'package:gymapp/main_app/main_app_page.dart';
import 'package:gymapp/presentation_screen/presentation_screen.dart';
import 'package:gymapp/splash/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:hydrated_bloc/hydrated_bloc.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'main_app/page3/data/workout_data.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("workout_database2");

  runApp(
    ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'main': (context) => const Mainapppage(),
          'intro': (context) => const PresentationScreen(),
        },
        theme: ThemeData(useMaterial3: true),
        home: SplashScreen(),
      ),
    ),
  );
}
