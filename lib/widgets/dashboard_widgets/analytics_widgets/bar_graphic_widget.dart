import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/widgets/widgets.dart';

class BarGraphic extends StatelessWidget {

  const BarGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height     : 400,
      width      : double.infinity,
      padding    : const EdgeInsets.all(appPadding),
      decoration : BoxDecoration(
        color        : graphicsBgColor,
        borderRadius : BorderRadius.circular(10),
      ),
      child      : Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children           : [
          const Padding(
            padding : EdgeInsets.symmetric(vertical: appPadding, horizontal: appPadding),
            child   : Text(
              "Job hours & Tasks per month",
              style: TextStyle(
                fontWeight : FontWeight.w700,
                fontSize   : 15,
                color      : graphicTextColor,
              ),
            ),
          ),
          const Expanded(
            child: MultipleBarChart(),
          ),
          Padding(
            padding : const EdgeInsets.only(left: appPadding, top: appPadding),
            child   : Row(
              mainAxisAlignment : MainAxisAlignment.start,
              children          : const[
                ReferenceIndicator(
                  referenceColor : Colors.orangeAccent,
                  referenceTitle : "Hours",
                  referenceSize  : 10,
                ),
                ReferenceIndicator(
                  referenceColor : Colors.redAccent,
                  referenceTitle : "Tasks",
                  referenceSize  : 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

