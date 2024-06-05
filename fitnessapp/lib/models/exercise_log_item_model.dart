import 'package:fitness_app/models/exercise_model.dart';
import 'package:flutter/material.dart';

class ExerciseLogItem {
  Exercise currentExercise;
  int restMinutes = 0;
  int restSeconds = 0;
  List<int> reps = [];
  List<bool> completed = [];
  List<double> weights = [];
  int sets = 0;
  List<TextEditingController> setControllers = [];
  List<TextEditingController> repControllers = [];
  ExerciseLogItem({required this.currentExercise});
}