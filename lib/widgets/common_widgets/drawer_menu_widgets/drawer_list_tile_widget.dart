import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:nationalizations/constants/constants.dart';

class DrawerListTile extends StatelessWidget {

  final String iconName;
  final String title;
  final VoidCallback onTap;

  const DrawerListTile({
    required this.title,
    required this.iconName,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding : const EdgeInsets.all(20),
        child   : Row(
          children: [
            SvgPicture.asset(
              "assets/icons/${this.iconName}.svg",
              color  : grey,
              height : 25
            ),
            Text(
              title,
              style: const TextStyle(color: grey)
            ),
          ],
        ),
      ),
    );
  }
}
