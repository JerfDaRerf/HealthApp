import 'package:flutter/material.dart';
import 'package:fitness_app/models/exercise_log_item_model.dart';


class ListViewExerciseBody extends StatefulWidget {
  final List<ExerciseLogItem> exerciseLog;

  ListViewExerciseBody({required this.exerciseLog});

  @override
  _ListViewExerciseBody createState() => _ListViewExerciseBody(exerciseLog: exerciseLog);
}

class _ListViewExerciseBody extends State<ListViewExerciseBody> {
  final List<ExerciseLogItem> exerciseLog;
  _ListViewExerciseBody({required this.exerciseLog});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 16.0),
      child: 
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                decoration: _bottomAndTopBorder(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                  child: overviewTitlesAndData(),
                ), 
              ),
            ),
            exerciseLogDisplay(),

          ],
      ),
    );
  }

  Expanded exerciseLogDisplay() {
    return Expanded(
      child: ListView.builder(
        itemCount: exerciseLog.length,
        itemBuilder: (context, index) => 
        Padding(
          padding: const EdgeInsets.only(top : 8.0, bottom: 8.0),
          child: exerciseDisplay(index),
        )
      ) 
    );
  }

  Column exerciseDisplay(int index) {
    return Column(
      children: [
        workoutHeader(index),
        restTimer(),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: setHeader(),
        ),
        addSetButton(),
      ],
    );
  }

  SizedBox addSetButton(){
    return SizedBox(
      width: double.infinity,
      height: 35,
      child: ElevatedButton(
          onPressed: (){},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 18.0,
              ),
              Text(
                "Add Set",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          )
      ),
    );
  }

  Row setHeader(){
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: Text('Set'),
        ),
        Expanded(
          flex: 4,
          child: Text('Previous'),
        ),
        Expanded(
          flex: 2,
          child: Center(child: Text("LBS")),
        ),
        Expanded(
          flex: 2,
          child: Center(child: Text("Reps")),
        ),
        Expanded(
          flex: 1,
          child: Icon(Icons.check),
        )
      ],
    );
  }

  Row workoutHeader(int index) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              "lib/exercises/${exerciseLog[index].currentExercise.displayFilePath}",
              width: 65,
              height: 65,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exerciseLog[index].currentExercise.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  exerciseLog[index].currentExercise.muscleGroups.join(", "),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.camera_alt_outlined,
            size: 28.0,  
          ),
        ],
      );
  }

  Row restTimer() {
    return const Row(
        children: [
          Icon(
            Icons.timer,
            size: 18.0,
          ),
          Text(
            " Rest Timer: 30s",
            style: TextStyle(
              fontSize: 15,
            )
          ),
        ]
      );
  }

  BoxDecoration _bottomAndTopBorder() {
    return const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          top: BorderSide(
            color: Colors.grey,
            width: 1, 
          )
        )
      );
  }

  Row overviewTitlesAndData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        overviewElement("Duration", "3m 20s", flex : 2),
        overviewElement("Volume", "2000 lbs", flex : 2),
        overviewElement("Sets", "5", flex: 1),
        overviewElement("Calories", "300 kCal", flex : 2),
      ]
    );
  }

  Expanded overviewElement(String title, String data, {int flex = 0}) {
    return Expanded(
      flex: flex, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )
          ),
        ],
      ),
    );
  }



}