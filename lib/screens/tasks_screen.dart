import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/widgets/widgets.dart';

class TasksScreen extends StatefulWidget {

  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int viewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : scaffoldColor,
      key             : _scaffoldKey,
      drawer          : const DrawerMenu(),
      appBar          : CustomAppbar(
        onPressed: () => _scaffoldKey.currentState!.openDrawer()
      ),
      body            : SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment : CrossAxisAlignment.start,
              mainAxisAlignment  : MainAxisAlignment.center,
              children           : [
                ScreenChangerButton(
                  buttonMargin : const EdgeInsets.only(right: 10, left: 40),
                  buttonColor  : Colors.redAccent,
                  height       : viewIndex == 0 ? 65 : 50,
                  buttonTitle  : "Tasks",
                  onTap        : () => setState(() => viewIndex = 0),
                ),
                ScreenChangerButton(
                  buttonMargin : const EdgeInsets.only(left: 10, right: 40),
                  buttonColor  : Colors.greenAccent,
                  height       : viewIndex == 1 ? 65 : 50,
                  buttonTitle  : "Notes",
                  onTap        : () => setState(() => viewIndex = 1),
                ),
              ],
            ),
            Row(
              crossAxisAlignment : CrossAxisAlignment.start,
              children           : [
                Expanded(
                  flex  : 5,
                  child : viewIndex == 0 ? const TaskWidget() : const NotesWidget()
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

