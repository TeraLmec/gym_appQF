import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  const Exercise(
      {required this.title,
      required this.prelude,
      required this.duration,
      this.index,
      this.startTime});

  final String? title;
  final int? prelude;
  final int? duration;
  final int? index;
  final int? startTime;

  factory Exercise.fromJson(Map<String, dynamic> json, index, int startTime) =>
      Exercise(
          title: json["title"],
          prelude: json["prelude"],
          duration: json["duration"],
          index: index,
          startTime: startTime);

  Map<String, dynamic> toJson() => {
        "title": title,
        "prelude": prelude,
        "duration": duration,
      };

  Exercise copyWith(
          {int? prelude,
          String? title,
          int? duration,
          int? index,
          int? startTime}) =>
      Exercise(
          title: title ?? this.title,
          prelude: prelude ?? this.prelude,
          duration: duration ?? this.duration,
          index: index ?? this.index,
          startTime: startTime ?? this.startTime);

  @override
  // TODO: implement props
  List<Object?> get props => [title, prelude, duration, index, startTime];

  @override
  bool get stringify => true;
}
