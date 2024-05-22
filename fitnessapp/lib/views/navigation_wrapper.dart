import 'package:flutter/material.dart';
import 'package:fitness_app/views/navigation_pages/home_page.dart';
import 'package:fitness_app/views/navigation_pages/workout_page.dart';
import 'package:fitness_app/views/navigation_pages/food_page.dart';
import 'package:fitness_app/views/navigation_pages/stats_page.dart';
import 'package:fitness_app/views/navigation_pages/profile_page.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({Key? key}) : super(key: key);

  @override
  _NavigationWrapper createState() => _NavigationWrapper();
}

class _NavigationWrapper extends State<NavigationWrapper> {
  // This determines and keeps track of what page the user is on
  int _selectedIndex = 0;

  int _iconSize = 30;

  // List of all the pages
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    WorkoutPage(),
    FoodPage(),
    StatsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)
            : const TextStyle(color: Colors.black),
          ),
          indicatorColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home_outlined, size:30, color: Colors.teal),
              icon: Icon(Icons.home_outlined, size:30),
              label: 'Home',
            ),
            NavigationDestination( 
              selectedIcon: ImageIcon(AssetImage("lib/icon/exercise_outline.png"), size: 30, color: Colors.teal),
              icon: ImageIcon(AssetImage("lib/icon/exercise_outline.png"), size: 30),
              label: 'Workouts',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.fastfood_outlined, size: 30, color: Colors.teal),
              icon: Icon(Icons.fastfood_outlined, size: 30),
              label: 'Diet',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bar_chart_outlined, size: 30, color: Colors.teal),
              icon: Icon(Icons.bar_chart_outlined, size: 30),
              label: 'Progress',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person_outlined, size: 30, color: Colors.teal),
              icon: Icon(Icons.person_outlined, size: 30),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      
    );
  }

  

}