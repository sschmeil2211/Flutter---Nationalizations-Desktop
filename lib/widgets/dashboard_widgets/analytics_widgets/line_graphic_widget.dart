import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/widgets/widgets.dart';

class LineGraphic extends StatelessWidget {

  final String graphicTitle;

  const LineGraphic({
    required this.graphicTitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height     : 350,
      padding    : const EdgeInsets.all(appPadding),
      decoration : BoxDecoration(
        color        : drawerColor,
        borderRadius : BorderRadius.circular(10),
      ),
      child      : Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children           : [
          Text(
            this.graphicTitle,
            style: const TextStyle(
              color      : graphicTextColor,
              fontWeight : FontWeight.w700,
              fontSize   : 15,
            ),
          ),
          const Expanded(
            child: SimpleLineChart(),
          )
        ],
      ),
    );
  }
}
