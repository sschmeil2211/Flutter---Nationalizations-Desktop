import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/widgets/widgets.dart';

class PieGraphic extends StatelessWidget {

  const PieGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height     : 350,
      width      : double.infinity,
      padding    : const EdgeInsets.all(appPadding),
      decoration : BoxDecoration(
        color        : drawerColor,
        borderRadius : BorderRadius.circular(10),
      ),
      child      : Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children           : const [
          Padding(
            padding : EdgeInsets.symmetric(vertical: 10),
            child   : Text(
              "Tasks",
              style: TextStyle(
                fontWeight : FontWeight.w700,
                fontSize   : 15,
                color      : graphicTextColor,
              ),
            ),
          ),
          Expanded(
            child: SimplePieChart(),
          ),
        ],
      ),
    );
  }
}