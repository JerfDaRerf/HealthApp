import 'package:fitness_app/models/exercise_model.dart';
import 'package:flutter/material.dart';

class ExerciseLog {
  List<ExerciseLogItem> exercisesLogItemList = [];
  ExerciseLog({required List<ExerciseLogItem> exerciseList}){
    for(ExerciseLogItem exerciseLogItem in exerciseList){
      exercisesLogItemList.add(exerciseLogItem);
    }
  }

  int numSets(){
    int totalSets = 0;
    for(ExerciseLogItem exerciseLogItem in exercisesLogItemList){
      totalSets += exerciseLogItem.sets;
    }
    return totalSets;
  }

  double calculateVolume(){
    double totalVolume = 0.0;
    double weight = 0.0;
    double reps = 0.0;
    for(ExerciseLogItem exerciseLogItem in exercisesLogItemList){
      for(int i = 0; i < exerciseLogItem.sets; i++){
        if(exerciseLogItem.completed[i] == true){
          totalVolume += exerciseLogItem.weights[i] * exerciseLogItem.reps[i];
        }
      }
    }
    return totalVolume;
  }
}

class ExerciseLogItem {
  Exercise currentExercise;
  int restMinutes = 0;
  int restSeconds = 0;
  List<int> reps = [];
  List<bool> completed = [];
  List<double> weights = [];
  int sets = 0;
  List<TextEditingController> weightControllers = [];
  List<TextEditingController> repControllers = [];
  ExerciseLogItem({required this.currentExercise});

  void addSet(){
    reps.add(0);
    completed.add(false);
    weights.add(0.0);
    sets++;
    weightControllers.add(TextEditingController());
    repControllers.add(TextEditingController());
  }
}