import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fitness_app/views/workout_views/ongoing_workout_page.dart';


class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  _WorkoutPage createState() => _WorkoutPage();
}

class _WorkoutPage extends State<WorkoutPage>{
  
  // This varialble 
  int selectedDate = 0;

  // This function is used to format the date
  // It will return a string that will be displayed on the screen based on currentDate
  // If the selectedDate is -1, 0, or 1, it will display the current word date
  String formatText(int date) {
    if (date == 0){
      return "Today";
    }
    if (date == 1){
      return "Tomorrow";
    }
    if (date == -1){
      return "Yesterday";
    }
    DateTime dateTime = DateTime.now().add(Duration(days: date));
    return "${DateFormat('EEE').format(dateTime)}, ${DateFormat('MMMM').format(dateTime)} ${dateTime.day}";
  }

  // This widget is the root of the application
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        actions: <Widget>[
          cameraButton(),
          gymLocationButton(),
        ],
      ),
      
      body: SafeArea( 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: <Widget>[ 
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 6.0), 
                    child: searchBar()
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: dateSelector(),
                  ),
                  muscleDisplay(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: workoutTitle(),
                  ),
                  Expanded(
                    child: SuggestedExercisesList(),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: (selectedDate < 0) ? previousStartButton() : startButtons(),
                ),
              )
            ],
          ) 
        )
      ),
     );
  }

  IconButton cameraButton() {
    return IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {
            // Navigate to the search page
            //WIP
          },
        );
  }

  IconButton gymLocationButton() {
    return IconButton(
      icon: const Icon(Icons.pin_drop_outlined),
      onPressed: () {
        // Navigate to the search page
        //WIP
      },
    );
  }

  ElevatedButton previousStartButton(){
    return ElevatedButton(
      onPressed: () {
        // Navigate to the workout page
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.add),
          Text('Start'),
        ],
      ),
    );
  }

  Container workoutTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        getWorkoutTitleBasedOnDate(selectedDate),
        style: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String getWorkoutTitleBasedOnDate(int date){
    if(date < 0){
      return "Workout history";
    }
    return "Suggested workout";
  }

  // This is used to display the search bar
  // and to control the functionality of a search bar
  // The search bar will allow the user to search for a specific workout
  // and from previous workouts
  // WIP
  Container searchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 2), 
          ),
        ],
      ),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller){
          return SearchBar(
            controller: controller,
      
            hintText: 'Search workouts ... ',
      
            leading: const Row(
              children: <Widget>[
                SizedBox(width: 10.0),
                Icon(Icons.search),
              ],
            ),
      
            onSubmitted: (String value) {
              // Navigate to the search page
            },
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller){
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        }
      ),
    );
  }

  Row startButtons(){
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the workout page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OngoingWorkoutPage()),
              );  
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add),
                Text('Quick Start'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the workout page
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.lightbulb_outline),
                Text('Suggested Start'),
              ],
            ),
          ),
        )
      ],
    );
  }

  // This is used to display the muscle groups that theb user will be working out for a specific date
  FractionallySizedBox muscleDisplay() {
    return FractionallySizedBox(
        widthFactor: 0.75, 
        child: Image.asset(
          'lib/images/temporary.png',
          fit: BoxFit.contain, // Make the image fill the available space
        ),
    );
  }

  // This is used to allow the user to select a specific date
  // At a given date, the program should recommend a workout given on the user's perferences
  // For example, maybe for a given day, the user will be recommended to do a leg workout
  // Maybe on another day, it will be a chest workout
  // Center dateSelector() {
  //   return Center(
  //     child: Row(
  //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget> [
  //         // go one date back
  //         IconButton(
  //           icon: const Icon(Icons.arrow_back_ios),
  //           onPressed: () {
  //             setState(() {
  //               selectedDate -= 1;
  //             });
  //           },
  //         ),
  //         Text(
  //           formatText(selectedDate),
  //           style: const TextStyle(
  //             fontSize: 20.0,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         // go one date forward
  //         IconButton(
  //           icon: const Icon(Icons.arrow_forward_ios),
  //           onPressed: () {
  //             setState(() {
  //               selectedDate += 1;
  //             });
  //           },
  //         ),
  //       ],
  //     ),       
  //   );

  // }
  Row dateSelector(){
    DateTime now = DateTime.now();
    int currentDayOfWeek = now.weekday;
    DateTime sunday = now.subtract(Duration(days: currentDayOfWeek % 7));
    List<String> days = ["S", "M", "T", "W", "T", "F", "S"];
    List<DateTime> weekDates = List.generate(7, (index) => sunday.add(Duration(days: index)).add(Duration(days: (selectedDate - selectedDate % 7))));

    return Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate -= 7;
                });
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 14.0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate = selectedDate - (selectedDate % 7);
                });
              },
              child: textDayColumn(days[0], weekDates[0].day.toString(), 6)
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate = selectedDate + (1 - selectedDate % 7);
                });
              },
              child: textDayColumn(days[1], weekDates[1].day.toString(), 0)
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate = selectedDate + (2 - selectedDate % 7);
                });
              },
              child: textDayColumn(days[2], weekDates[2].day.toString(), 1)
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate = selectedDate + (3 - selectedDate % 7);
                });
              },
              child: textDayColumn(days[3], weekDates[3].day.toString(), 2)
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate = selectedDate + (4 - selectedDate % 7);
                });
              },
              child: textDayColumn(days[4], weekDates[4].day.toString(), 3)
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate = selectedDate + (5 - selectedDate % 7);
                });
              },
              child: textDayColumn(days[5], weekDates[5].day.toString(), 4)
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate = selectedDate + (6 - selectedDate % 7);
                });
              },
              child: textDayColumn(days[6], weekDates[6].day.toString(), 5)
            )
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedDate += 7;
                });
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
            ),
          ),
        ],
    );
  }

  Column textDayColumn(String currentDayOfWeek, String date, int indexDayOfWeek){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          currentDayOfWeek,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.grey, 
          ),
        ),
        const SizedBox(height: 2.0),
        Container(
          width: 27,
          height: 27, 
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: circleColorBasedOnDate(indexDayOfWeek),
            shape: BoxShape.circle,
          ),
          child: Text(
            date,
            style: TextStyle(
              fontSize: 16.0,
              color: textColorBasedOnDate(indexDayOfWeek),
            ),
          ),
        ),
      ],
    );
  }

  Color circleColorBasedOnDate(int indexDayOfWeek){
    if(selectedDate == 0 && indexDayOfWeek == DateTime.now().weekday - 1){
      return Colors.teal;
    }
    if(selectedDate % 7 == 0 && indexDayOfWeek == DateTime.now().weekday - 1){
      return Colors.teal.withOpacity(0.5);
    }
    int dayOfWeek = (indexDayOfWeek + 1 ) % 7;
    if(dayOfWeek == selectedDate % 7){
      return Colors.grey.withOpacity(0.7);
    }
    return Colors.transparent;
  }

  Color textColorBasedOnDate(int indexDayOfWeek){
    int dayOfWeek = (indexDayOfWeek + 1 ) % 7;
    if((selectedDate - selectedDate % 7) == 0 
    && indexDayOfWeek == DateTime.now().weekday - 1 
    && dayOfWeek != selectedDate % 7){
      return Colors.teal;
    }
    if(dayOfWeek == selectedDate % 7){
      return Colors.white;
    }
    return Colors.black;
  }

}



class SuggestedExercisesList extends StatelessWidget{

  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index){
        return Column(
          children: <Widget>[
            Row(
              children: [
                gifBorder(exerciseGIF()),
                Expanded(
                  child: exerciseDescription()
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: checkIcon(),
                ),
                infoIcon(),
              ],
            ),
            // const SizedBox(height: 10.0),
            Container(
              height: 0.7, 
              width: double.infinity,
              color: Colors.grey, 
              margin: const EdgeInsets.fromLTRB(100.0, 5.0, 0.0, 5.0),
            ),
          ],
        );
      }
    );
  }

  Icon checkIcon() {
    return const Icon(
      Icons.add_box_outlined,
      color: Colors.grey,
      size: 26,
    );
  }

  Icon infoIcon() {
    return const Icon(
      Icons.info_outline_rounded,
      color: Colors.grey,
      size: 26,
    );
  }

  Padding exerciseDescription() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text(
            'Weighted Crunch',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Abs',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          )
        ]
      ),
    );
  }

  Container gifBorder(Widget gif) {
    return Container(
      width: 90.0,
      height: 90.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.grey,
        //   width: 0.3,
        // ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: gif,
      ),
    );
  }
  
  ClipRRect exerciseGIF() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        'lib/exercises/12501301-Weighted-Crunch-(behind-head)_Waist_360.gif'
      ),
    );
  }

}
