import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:nationalizations/constants/constants.dart';

class SimpleLineChart extends StatefulWidget {

  const SimpleLineChart({super.key});

  @override
  SimpleLineChartState createState() => SimpleLineChartState();
}

class SimpleLineChartState extends State<SimpleLineChart> {

  List<Color> gradientColors = [
    primaryColor,
    secondaryColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.all(appPadding),
      child   : LineChart(
        LineChartData(
          gridData   : FlGridData(show: false),
          titlesData : FlTitlesData(
            show         : true,
            bottomTitles : SideTitles(
              showTitles    : true,
              reservedSize  : 22,
              getTextStyles : (context, value) => const TextStyle(
                color      : graphicTextColor,
                fontWeight : FontWeight.bold,
                fontSize   : 14,
              ),
              getTitles     : (value) {
                switch(value.toInt()){
                  case 1:
                    return 'Sun';
                  case 4:
                    return 'Mon';
                  case 7:
                    return 'Tue';
                  case 10:
                    return 'Wed';
                  case 13:
                    return 'Thr';
                  case 16:
                    return 'Fri';
                  case 19:
                    return 'Sat';
                }
                return '';
              }
            ),
          ),
          borderData   : FlBorderData(show: false),
          minX         : 0,
          maxX         : 20,
          maxY         : 0,
          minY         : 6,
          lineBarsData : [
            LineChartBarData(
              spots            : [
                FlSpot(0, 3),
                FlSpot(4, 2),
                FlSpot(9, 4),
                FlSpot(12, 3),
                FlSpot(15, 5),
                FlSpot(18, 3),
                FlSpot(20, 4),
              ],
              isCurved         : true,
              colors           : [primaryColor],
              barWidth         : 5,
              isStrokeCapRound : true,
              dotData          : FlDotData(show: true),
              belowBarData     : BarAreaData(
                show         : true,
                colors       : gradientColors.map((e) => e.withOpacity(0.3)).toList(),
                gradientFrom : const Offset(0, 0),
                gradientTo   : const Offset(0, 1.75)
              )
            )
          ]
        )
      ),
    );
  }
}

