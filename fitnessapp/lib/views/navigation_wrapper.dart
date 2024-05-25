import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/views/navigation_pages/home_page.dart';
import 'package:fitness_app/views/navigation_pages/workout_page.dart';
import 'package:fitness_app/views/navigation_pages/food_page.dart';
import 'package:fitness_app/views/navigation_pages/stats_page.dart';
import 'package:fitness_app/views/navigation_pages/profile_page.dart';

import 'package:fitness_app/themes/navigation_icon_themes.dart';

/*
Navigation wrapper serves to define the underlying structure of the app
This will create an app that has 5 icons at the bottom.
Navigation wrapper is also in charge of handling the logic 
and redirecting the user when icons are clicked on.
*/ 

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({Key? key}) : super(key: key);

  @override
  _NavigationWrapper createState() => _NavigationWrapper();
}

class _NavigationWrapper extends State<NavigationWrapper> {
  // This determines and keeps track of what page the user is on
  int _selectedIndex = 0;

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
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Container(
          decoration: _topBorder(),
          child: NavigationBarTheme(
            // sets the theme of the navigation bar
            data: _navigationBarThemeData(),
            // actual navigation bar
            child: _navigationBar(),
          ),
        ),
      ),

      // Sets the screen of the app based on what is selected
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      
    );
  }

  BoxDecoration _topBorder() {
    return const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          )
        )
      );
  }

  NavigationBar _navigationBar() {
    return NavigationBar(
        // This is used to determine which icon is selected internally
        // This does not affect which page is currently being viewed
        // This affects which icon is highlighted
        selectedIndex: _selectedIndex,
        // sets behaviour when an icon is selected
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        // destination icons
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.house),
            icon: Icon(CupertinoIcons.house),
            label: 'Home',
          ),
          NavigationDestination( 
            selectedIcon: ImageIcon(AssetImage("lib/icon/exercise_outline.png")),
            icon: ImageIcon(AssetImage("lib/icon/exercise_outline.png")),
            label: 'Workouts',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fastfood_outlined, size: NavIconTheme.iconSize),
            icon: Icon(Icons.fastfood_outlined, size: NavIconTheme.iconSize),
            label: 'Diet',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.chart_bar_alt_fill),
            icon: Icon(CupertinoIcons.chart_bar_alt_fill),
            label: 'Progress',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.person_circle),
            icon: Icon(CupertinoIcons.person_circle),
            label: 'Profile',
          ),
        ],
      );
  }

  NavigationBarThemeData _navigationBarThemeData() {
    return NavigationBarThemeData(
        // This defines a property of the icon that basically says:
        // If the icon is clicked on,
        // bold and change the color of the icon label
        // else keep it its normal color
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) => states.contains(MaterialState.selected)
          ? const TextStyle(fontSize: NavIconTheme.iconLabelFontSize, color: NavIconTheme.iconSelectedColor)
          : const TextStyle(fontSize: NavIconTheme.iconLabelFontSize, color: NavIconTheme.iconNotSelectedColor),
        ),

        // Sets the theme of the icon based on the state of the icon
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
          (Set<MaterialState> states) => states.contains(MaterialState.selected)
          ? const IconThemeData(size: NavIconTheme.iconSize, color: NavIconTheme.iconSelectedColor) 
          : const IconThemeData(size: NavIconTheme.iconSize, color: NavIconTheme.iconNotSelectedColor),  
        ),
        // Removes the selected icon indicator 
        indicatorColor: Colors.transparent,
        // Removes the gray indicator when clicking on an icon
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        // Sets the background of the navigation bar to white
        backgroundColor: Colors.white,
        // Removes the tint
        surfaceTintColor: Colors.transparent,
      );
  }

  

}