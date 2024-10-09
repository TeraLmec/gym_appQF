import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:gymapp/main_app/page3/datatime/data_time.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap(
      {super.key, required this.datasets, required this.startDateYYYYMMDD});

  final Map<DateTime, int>? datasets;
  final String startDateYYYYMMDD;

  @override
  Widget build(BuildContext context) {
    return HeatMap(
        startDate: createDateTimeObject(startDateYYYYMMDD),
        endDate: DateTime.now().add(const Duration(days: 18)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: const Color.fromARGB(255, 190, 55, 50),
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 40,
        colorsets: const {1: Colors.black});
  }
}
