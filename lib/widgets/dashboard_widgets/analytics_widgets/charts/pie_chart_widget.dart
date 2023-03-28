import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:nationalizations/widgets/widgets.dart';

class SimplePieChart extends StatefulWidget {

  const SimplePieChart({super.key});

  @override
  State<StatefulWidget> createState() => SimplePieChartState();
}

class SimplePieChartState extends State {

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
              pieTouchData      : PieTouchData(
                touchCallback: (pieTouchResponse) => setState(() {
                  touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                })
              ),
              borderData        : FlBorderData(show: false),
              sectionsSpace     : 2,
              centerSpaceRadius : 0,
              sections          : showingSections(),
            ),
          ),
        ),
        Column(
          children: [
            ReferenceIndicator(
              referenceTitle : "Complete",
              referenceSize  : touchedIndex == 0 ? 18 : 16,
              referenceColor : touchedIndex == 0 ? Colors.green : Colors.greenAccent
            ),
            ReferenceIndicator(
              referenceTitle : "Skipped",
              referenceSize  : touchedIndex == 1 ? 18 : 16,
              referenceColor : touchedIndex == 1 ? Colors.red : Colors.redAccent
            ),
            ReferenceIndicator(
              referenceTitle : "Undefined",
              referenceSize  : touchedIndex == 2 ? 18 : 16,
              referenceColor : touchedIndex == 2 ? Colors.blue : Colors.blueGrey,
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {

        final isTouched = i == touchedIndex;

        switch (i) {
          case 0:
            return PieChartSectionData(
              title      : "C",
              color      : Colors.greenAccent,
              value      : 25,
              radius     : 65,
              borderSide : BorderSide(
                color: Colors.grey,
                width: isTouched ? 3 : 0
              )
            );
          case 1:
            return PieChartSectionData(
              title      : "S",
              color      : Colors.redAccent,
              value      : 25,
              radius     : 80,
              borderSide : BorderSide(
                color: Colors.grey,
                width: isTouched ? 3 : 0
              )
            );
          case 2:
            return PieChartSectionData(
              title      : "U",
              color      : Colors.blueGrey,
              value      : 25,
              radius     : 60,
              borderSide : BorderSide(
                color: Colors.grey,
                width: isTouched ? 3 : 0
              ),
            );
          default:
            throw Error();
        }
      },
    );
  }
}