import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/widgets/widgets.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget{

  final void Function() onPressed;

  const CustomAppbar({
    required this.onPressed,
    super.key
  });

  @override
  Size get preferredSize => const Size.fromRadius(40);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: drawerColor,
      child: Row(
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children          : [
          IconButton(
            onPressed : onPressed,
            icon      : Icon(
              Icons.menu,
              color: bgColor.withOpacity(0.5)
            ),
          ),
          const SearchField(),
          Row(
            children: [
              if(!Responsive.isMobile(context))
                const JobSessionTimer(),
              if(!Responsive.isMobile(context))
                const NotificationButton(),
              if(!Responsive.isMobile(context))
                const CalendarButton(),
              const UserButton()
            ],
          )
        ],
      ),
    );
  }
}