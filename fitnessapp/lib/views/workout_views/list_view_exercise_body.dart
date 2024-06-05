import 'package:flutter/material.dart';


class ListViewExerciseBody extends StatefulWidget {
  const ListViewExerciseBody({Key? key}) : super(key: key);

  @override
  _ListViewExerciseBody createState() => _ListViewExerciseBody();
}

class _ListViewExerciseBody extends State<ListViewExerciseBody> {
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
          ],
      ),
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