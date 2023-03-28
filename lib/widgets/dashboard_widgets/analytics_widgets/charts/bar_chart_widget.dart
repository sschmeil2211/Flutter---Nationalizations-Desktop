import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:nationalizations/constants/constants.dart';

class MultipleBarChart extends StatelessWidget {

  const MultipleBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: BarChart(
        BarChartData(
          borderData  : FlBorderData(
            border: Border.all(width: 0)
          ),
          groupsSpace : 15,
          titlesData  : FlTitlesData(
            show         : false,
            bottomTitles : SideTitles(
              showTitles    : true,
              getTextStyles : (context, value) => const TextStyle(
                color      : graphicTextColor,
                fontWeight : FontWeight.bold,
                fontSize   : 12,
              ),
              margin        : appPadding,
              getTitles     : (double value) {
                if (value == 1)
                  return 'J';
                if (value == 2)
                  return 'F';
                if (value == 3)
                  return 'M';
                if (value == 4)
                  return 'A';
                if (value == 5)
                  return 'M';
                if (value == 6)
                  return 'J';
                if (value == 7)
                  return 'J';
                if (value == 8)
                  return 'A';
                if (value == 9)
                  return 'S';
                if (value == 10)
                  return 'O';
                if (value == 11)
                  return 'N';
                if (value == 12)
                  return 'D';
                else
                  return '';
              }
            ),
          ),
          barGroups   : [
            BarChartGroupData(
              x       : 1,
              barRods : [
                BarChartRodData(
                  y            : 15,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 23,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 2,
              barRods : [
                BarChartRodData(
                  y            : 4,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 14,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 3,
              barRods : [
                BarChartRodData(
                  y            : 18,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 14,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 4,
              barRods : [
                BarChartRodData(
                  y            : 18,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 13,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 5,
              barRods : [
                BarChartRodData(
                  y            : 12,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 6,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 6,
              barRods : [
                BarChartRodData(
                  y            : 3,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 5,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 7,
              barRods : [
                BarChartRodData(
                  y            : 18,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 20,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 8,
              barRods : [
                BarChartRodData(
                  y            : 18,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 13,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 9,
              barRods : [
                BarChartRodData(
                  y            : 4,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 1,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 10,
              barRods : [
                BarChartRodData(
                  y            : 26,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 13,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 11,
              barRods : [
                BarChartRodData(
                  y            : 18,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 24,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
            BarChartGroupData(
              x       : 12,
              barRods : [
                BarChartRodData(
                  y            : 12,
                  width        : 20,
                  colors       : [Colors.orangeAccent],
                  borderRadius : BorderRadius.circular(5),
                ),
                BarChartRodData(
                  y            : 12,
                  width        : 20,
                  colors       : [Colors.redAccent],
                  borderRadius : BorderRadius.circular(5)
                )
              ]
            ),
          ]
        )
      ),
    );
  }
}
