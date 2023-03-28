import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/widgets/widgets.dart';

class DrawerMenu extends StatelessWidget {

  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor : drawerColor,
      child           : ListView(
        shrinkWrap : true,
        children   : [
          Container(
            padding : const EdgeInsets.all(appPadding),
            child   : Image.asset("assets/images/logowithtext.png"),
          ),
          DrawerListTile(
            iconName : 'dashboard',
            title    : 'Dashboard',
            onTap    : () => Navigator.of(context).pushReplacementNamed("dashboardScreen")
          ),
          DrawerListTile(
            iconName : 'task',
            title    : 'Tasks',
            onTap    : () => Navigator.of(context).pushReplacementNamed("tasksScreen")
          ),
          DrawerListTile(
            iconName : 'clients',
            title    : 'Clients',
            onTap    : () => print("Clients Screen")
          ),
          DrawerListTile(
            iconName : 'statistics',
            title    : 'Statistics',
            onTap    : () => print("Statistics")
          ),
          const Padding(
            padding : EdgeInsets.symmetric(horizontal: appPadding * 2),
            child   : Divider(
              color     : grey,
              thickness : 0.2,
            ),
          ),
          DrawerListTile(
            iconName : 'settings',
            title    : 'Settings',
            onTap    : () => print("settings")
          ),
          DrawerListTile(
            iconName : 'logout',
            title    : 'Logout',
            onTap    : () => print("Logout")
          ),
          //JobSessionTimer(),
        ],
      ),
    );
  }
}
