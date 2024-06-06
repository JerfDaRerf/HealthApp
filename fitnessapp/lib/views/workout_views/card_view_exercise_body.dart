import 'package:fitness_app/models/exercise_log_model.dart';
import 'package:flutter/material.dart';

class CardViewExerciseBody extends StatefulWidget {
  final ExerciseLog exerciseLog;

  CardViewExerciseBody({required this.exerciseLog});

  @override
  _CardViewExerciseBody createState() => _CardViewExerciseBody(exerciseLog: exerciseLog);
}

class _CardViewExerciseBody extends State<CardViewExerciseBody> {
  final ExerciseLog exerciseLog;
  _CardViewExerciseBody({required this.exerciseLog});

  @override
  Widget build(BuildContext context) {
    return Text(
      exerciseLog.exercisesLogItemList.length.toString(),
    );
  }
}