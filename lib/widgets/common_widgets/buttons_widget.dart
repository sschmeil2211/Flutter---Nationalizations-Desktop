import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:nationalizations/constants/constants.dart';

class NotificationButton extends StatelessWidget {

  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.all(appPadding),
      child   : Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/bell.svg",
            height : 35,
            color  : bgColor.withOpacity(0.8),
          ),
          Positioned(
            right : 0,
            child : Container(
              height     : 10,
              width      : 10,
              decoration : const BoxDecoration(
                shape : BoxShape.circle,
                color : red,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CalendarButton extends StatelessWidget {

  const CalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.all(appPadding),
      child   : Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/calendar.svg",
            height : 35,
            color  : bgColor.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}

class UserButton extends StatelessWidget {

  const UserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.symmetric(horizontal: appPadding, vertical: appPadding / 2),
      child: Row(
        children: [
          if(!Responsive.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: appPadding / 2),
              child: Text(
                'User',
                  style: TextStyle(
                    color      : bgColor,
                    fontWeight : FontWeight.w700,
                  ),
                ),
            ),
          ClipRRect(
            borderRadius : BorderRadius.circular(30),
            child        : Image.asset(
              'assets/images/photo3.jpg',
              height : 38,
              width  : 38,
              fit    : BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenChangerButton extends StatelessWidget {

  final Color buttonColor;
  final double height;
  final EdgeInsetsGeometry buttonMargin;
  final String buttonTitle;
  final void Function() onTap;

  const ScreenChangerButton ({
    required this.buttonColor,
    required this.height,
    required this.buttonMargin,
    required this.buttonTitle,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap : this.onTap,
        child : Container(
          margin     : this.buttonMargin,
          height     : this.height,
          decoration : BoxDecoration(
            color        : this.buttonColor,
            boxShadow    : [
              BoxShadow(
                color        : Colors.black.withOpacity(0.5),
                spreadRadius : 2,
                blurRadius   : 7,
                offset       : const Offset(0, 0)
              ),
            ],
            borderRadius : const BorderRadius.vertical(
              bottom: Radius.circular(15)
            )
          ),
          child: responsiveTitle(context),
        ),
      ),
    );
  }

  Widget? responsiveTitle (BuildContext context){
    if(Responsive.isMobile(context)) return null;
    else
      return Center(
        child: Text(
          this.buttonTitle,
          style: const TextStyle(
              color      : textColor,
              fontWeight : FontWeight.w600,
              fontSize   : 16
          ),
        ),
      );
  }
}

class TasksAndNotesButtons extends StatelessWidget {

  final IconData buttonIcon;
  final String buttonTitle;
  final void Function() onPressed;

  const TasksAndNotesButtons({
    required this.buttonIcon,
    required this.buttonTitle,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.symmetric(horizontal: 5),
      child   : ElevatedButton(
        style     : ButtonStyle(
          backgroundColor : MaterialStateProperty.all(Colors.redAccent),
          shape           : MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed : this.onPressed,
        child     : Row(
          children: [
            Icon(this.buttonIcon),
            Text(this.buttonTitle),
          ],
        ),
      ),
    );
  }
}


