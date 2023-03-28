import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {

  DashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: Row(
          crossAxisAlignment : CrossAxisAlignment.start,
          children           : const [
            Expanded(
              flex  : 5,
              child : DashboardContent(),
            )
          ],
        ),
      ),
    );
  }
}
