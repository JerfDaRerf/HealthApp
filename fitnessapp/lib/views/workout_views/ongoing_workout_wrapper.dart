import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'list_view_exercise_body.dart';
import 'card_view_exercise_body.dart';

import 'package:fitness_app/models/exercise_log_model.dart';
import 'package:fitness_app/models/exercise_model.dart';

class OngoingWorkoutPage extends StatefulWidget {
  const OngoingWorkoutPage({Key? key}) : super(key: key);

  @override
  State<OngoingWorkoutPage> createState() => _OngoingWorkoutPage();
}


class _OngoingWorkoutPage extends State<OngoingWorkoutPage> {
  late Timer _timer;
  int _elapsedSeconds = 0;
  bool started = false;
  String output = 'Start';
  bool listView = false;
  
  ExerciseLog exerciseLog = ExerciseLog(exerciseList: [
    ExerciseLogItem(currentExercise: Exercise(name: "Weighted Crunch", displayFilePath: "12501301-Weighted-Crunch-(behind-head)_Waist_360.gif", muscleGroups: ["Abs"])),
    ExerciseLogItem(currentExercise: Exercise(name: "Weighted Crunch", displayFilePath: "12501301-Weighted-Crunch-(behind-head)_Waist_360.gif", muscleGroups: ["Abs"]))
    ]);

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  String timeToString(){
    if(!started){
      return("--");
    }
    if(_elapsedSeconds < 60){
      return("${_elapsedSeconds}s");
    }
    if(_elapsedSeconds ~/ 60 < 60){
      return("${_elapsedSeconds ~/ 60}m ${_elapsedSeconds % 60}s");
    }
    return("${_elapsedSeconds ~/ 3600}h ${(_elapsedSeconds % 3600) ~/ 60}m ${_elapsedSeconds % 60}s");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ongoingWorkoutTopBar(context),
      body: SafeArea(
        child: listView ? ListViewExerciseBody(exerciseLog: exerciseLog) : CardViewExerciseBody(exerciseLog: exerciseLog),
      )
    );
  }

  AppBar ongoingWorkoutTopBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const ImageIcon(
          AssetImage('lib/icon/arrow_down.png'),
          size: 18.0,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        padding: const EdgeInsets.only(left: 16.0),
      ),
      leadingWidth: 40.0,
      title: const Text(
        'Log Workout',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: <Widget>[
        modeSwitch(),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 16.0),
          child: SizedBox(
            width: 80, 
            height: 35,
            child: startWorkoutButton()
          ),
        ),
      ]
    );
  }

  Switch modeSwitch(){
    return Switch(
      value: listView,
      onChanged: (bool value) {
        setState(() {
          listView = !listView;
        });
      },
      thumbIcon: MaterialStateProperty.all<Icon>(
          const Icon(Icons.list),
      ),
      activeColor: Colors.white,
      activeTrackColor: Colors.teal,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.white,
      trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
        ? Colors.teal :
        Colors.grey
      ),
      trackOutlineWidth: MaterialStateProperty.all<double>(
        2,
      ),
    );
  }

  ElevatedButton startWorkoutButton() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            output = 'Finish';
            if(!started){
              _startTimer();
            }
            started = true;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // backgroundColor: Colors.teal,
        ),
        child: Text(
          output
        ),
      );
  }
}