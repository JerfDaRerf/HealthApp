import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        title: const Text('Workout'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {
              // Navigate to the search page
            },
          ),
          IconButton(
            icon: const Icon(Icons.pin_drop_outlined),
            onPressed: () {
              // Navigate to the search page
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      
      backgroundColor: Colors.white,
      
      body: SafeArea( 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 6.0), 
                child: searchBar()
              ),
              dateSelector(),
              muscleDisplay(),
              workoutTitle(),
              Expanded(
                child: SuggestedExercises()
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 16.0),
                child: (selectedDate < 0) ? previousStartButton() : startButtons(),
              ),
            ],
          )
        )
      ),
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
          fontSize: 24.0,
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
  Center dateSelector() {
    return Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          // go one date back
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                selectedDate -= 1;
              });
            },
          ),
          Text(
            formatText(selectedDate),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // go one date forward
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              setState(() {
                selectedDate += 1;
              });
            },
          ),
        ],
      ),       
    );

  }
}


class SuggestedExercises extends StatelessWidget {
  final List<int> items = List<int>.generate(1000, (i) => i);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Workout ${items[index]}'),
        );
      },
    );
  }
}