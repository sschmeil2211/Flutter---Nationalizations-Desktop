import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:nationalizations/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title                      : 'nationalizations',
      initialRoute               : 'tasksScreen',
      routes                     : {
        'dashboardScreen' : ( _ ) => DashboardScreen(),
        'tasksScreen'     : ( _ ) => const TasksScreen(),
      },
      darkTheme                  : ThemeData.dark(),
      theme                      : ThemeData(
        textTheme: GoogleFonts.barlowTextTheme(),
      ),
    );
  }
}