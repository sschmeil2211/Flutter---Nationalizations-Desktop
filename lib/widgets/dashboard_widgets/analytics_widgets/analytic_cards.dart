import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/models/graphic_info_model.dart';
import 'package:nationalizations/widgets/widgets.dart';

class ResponsiveAnalyticCards extends StatelessWidget {

  const ResponsiveAnalyticCards({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    //Todo: Fix widgets fot screens smaller than 352, 172

    return Responsive(
      mobile  : AnalyticsCards(
        crossAxisCount   : size.width < 650 ? 2 : 4,
        childAspectRatio : size.width < 650 ? 2 : 1.5,
      ),
      tablet  : AnalyticsCards(),
      desktop : AnalyticsCards(
        childAspectRatio: size.width < 1400 ? 1.5 : 4,
      ),
    );
  }
}

class AnalyticsCards extends StatelessWidget {

  final int crossAxisCount;
  final double childAspectRatio;

  AnalyticsCards({
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.4,
    super.key
  });

  final List<VisualData> nationalizationsClientData = [
    VisualData(
      title  : "France",
      count  : 720,
      svgSrc : "assets/flags/fr.svg",
      color  : primaryColor,
    ),
    VisualData(
      title  : "England",
      count  : 820,
      svgSrc : "assets/flags/eng.svg",
      color  : purple,
    ),
    VisualData(
      title  : "Italy",
      count  : 920,
      svgSrc : "assets/flags/it.svg",
      color  : orange,
    ),
    VisualData(
      title  : "Spain",
      count  : 920,
      svgSrc : "assets/flags/ea.svg",
      color  : green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics      : const NeverScrollableScrollPhysics(),
      shrinkWrap   : true,
      itemCount    : nationalizationsClientData.length,
      gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount   : crossAxisCount,
        crossAxisSpacing : appPadding,
        mainAxisSpacing  : appPadding,
        childAspectRatio : childAspectRatio,
      ),
      itemBuilder: (context, index) => AnalyticInfoCard(
        count     : nationalizationsClientData[index].count,
        svgSrc    : nationalizationsClientData[index].svgSrc,
        titleCard : nationalizationsClientData[index].title,
      ),
    );
  }
}
